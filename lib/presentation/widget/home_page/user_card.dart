import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/app_router.dart';
import '../../../domain/models/user_model.dart';
import '../../bloc/bloc/user_bloc.dart';

class UserCards extends StatelessWidget {
  final List<UserModel> users;
  const UserCards({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RefreshIndicator(
        onRefresh: () async {
          final userBloc = BlocProvider.of<UserBloc>(context);
          userBloc.add(FetchUsersEvent());
          await userBloc.stream
              .firstWhere((element) => element.status != UserStatus.loading);
          return;
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
