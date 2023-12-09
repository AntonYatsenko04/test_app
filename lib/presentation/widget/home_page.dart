import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/router/app_router.dart';

import '../../domain/models/user_model.dart';
import '../bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => GetIt.I<UserBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Users",
            style: textTheme.headlineLarge,
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            final userBloc = BlocProvider.of<UserBloc>(context);
            switch (state.status) {
              case UserStatus.initial:
                {
                  userBloc.add(FetchUsersEvent());
                  return const Center(child: CircularProgressIndicator());
                }
              case UserStatus.onlineSuccess:
                {
                  return _UserCards(
                    users: state.users,
                    isOnline: true,
                  );
                }
              case UserStatus.offlineSuccess:
                {
                  return _UserCards(
                    users: state.users,
                    isOnline: false,
                  );
                }
              case UserStatus.failure:
                {
                  return Center(
                    child: TextButton(
                        onPressed: () => userBloc.add(FetchUsersEvent()),
                        child: Text(
                          "Refresh page",
                          style: textTheme.bodySmall,
                        )),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

class _UserCards extends StatelessWidget {
  final List<UserModel> users;
  final bool isOnline;
  const _UserCards({required this.users, required this.isOnline, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RefreshIndicator(
        onRefresh: () {
          BlocProvider.of<UserBloc>(context).add(FetchUsersEvent());
          return Future(() => Duration.zero);
        },
        child: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              color: Theme.of(context).cardColor,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                enableFeedback: true,
                splashColor: Colors.orange[500],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 12, 10, 8),
                  child: Text(
                    users[index].name,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium,
                  ),
                ),
                onTap: () async {
                  await AutoRouter.of(context)
                      .push(UserRoute(user: users[index]));
                },
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 2,
          ),
        ),
      ),
    );
  }
}
