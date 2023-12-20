import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_card.dart';

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
        body: BlocConsumer<UserBloc, UserState>(
          listenWhen: (previous, current) {
            return current.status != UserStatus.initial &&
                current.status != UserStatus.loading;
          },
          listener: (context, state) {
            late String snackBarText;
            if (state.status == UserStatus.onlineSuccess) {
              snackBarText = 'Online mode';
            } else if (state.status == UserStatus.offlineSuccess) {
              snackBarText = 'Offline mode';
            } else {
              snackBarText = 'Offline mode, no previous data found';
            }
            final snackBar = SnackBar(
              content: Text(snackBarText),
            );
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          buildWhen: (previous, current) {
            return current.status != UserStatus.loading;
          },
          builder: (context, state) {
            final userBloc = BlocProvider.of<UserBloc>(context);
            if (state.status == UserStatus.initial) {
              userBloc.add(FetchUsersEvent());
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == UserStatus.onlineSuccess ||
                state.status == UserStatus.offlineSuccess) {
              return UserCards(
                users: state.users,
              );
            } else {
              return Center(
                child: TextButton(
                    onPressed: () => userBloc.add(FetchUsersEvent()),
                    child: Text(
                      "Refresh page",
                      style: textTheme.bodySmall,
                    )),
              );
            }
          },
        ),
      ),
    );
  }
}
