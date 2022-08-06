import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wise_dev/pages/home/view/home_page.dart';

class AppRoute {
  static const home = '/';
  static const about = '/about';
}

GoRouter createGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: AppRoute.home,
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoute.about,
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
    ],
  );
}
