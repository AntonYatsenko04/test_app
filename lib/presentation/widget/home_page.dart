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
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.I<UserBloc>(),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            final userBloc = BlocProvider.of<UserBloc>(context);
            switch (state.status) {
              case UserStatus.initial:
                {
                  userBloc.add(FetchUsersEvent());
                  return const CircularProgressIndicator();
                }
              case UserStatus.loading:
                {
                  return const CircularProgressIndicator();
                }
              case UserStatus.onlineSuccess:
                {
                  return _userCards(state.users);
                }
              case UserStatus.offlineSuccess:
                {
                  return _userCards(state.users);
                }
              case UserStatus.failure:
                {
                  return const Text("Error");
                }
            }
          },
        ),
      ),
    ));
  }

  _userCards(List<UserModel> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Text(users[index].name),
            ),
            onTap: () {
              AutoRouter.of(context).push(UserRoute(user: users[index]));
            },
          );
        });
  }
}
