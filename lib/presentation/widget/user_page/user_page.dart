import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/user_model.dart';
import 'section.dart';

@RoutePage()
class UserPage extends StatelessWidget {
  final UserModel user;
  const UserPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Profile',
        style: theme.headlineLarge,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.boy,
                  size: 200,
                ),
              ),
              Center(
                child: Text(
                  user.name,
                  style: theme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Section(boldText: 'Email:', thinText: user.email),
              Section(
                  boldText: 'Address:',
                  thinText:
                      '${user.address.city}, ${user.address.street}, ${user.address.suite}'),
              Section(boldText: 'Phone:', thinText: user.phone),
              Section(boldText: 'Company:', thinText: user.company.name),
            ],
          ),
        ),
      ),
    );
  }
}
