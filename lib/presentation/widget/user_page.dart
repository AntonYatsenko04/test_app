import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../domain/models/user_model.dart';

@RoutePage()
class UserPage extends StatelessWidget {
  final UserModel user;
  const UserPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [Text(user.toString())],
      ),
    ));
  }
}
