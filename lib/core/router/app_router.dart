import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/widget/home_page.dart';
import 'package:test_app/presentation/widget/user_page.dart';
import '../../domain/models/user_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: UserRoute.page)
      ];
}
