import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wise_dev/pages/about/view/about_page.dart';
import 'package:wise_dev/pages/home/view/home_page.dart';

class AppRoute {
  const AppRoute({
    required this.path,
    required this.buildPage,
  });

  final String path;
  final Widget Function() buildPage;

  navigate(BuildContext context) {
    context.go(path);
  }
}

class RegisteredRoutes {
  static final home = AppRoute(
    path: '/',
    buildPage: () => const HomePage(),
  );
  static final about = AppRoute(
    path: '/about',
    buildPage: () => const AboutPage(),
  );
}

GoRouter createGoRouter() {
  return GoRouter(
    routes: [
      RegisteredRoutes.home,
      RegisteredRoutes.about,
    ]
        .map((route) => GoRoute(
              path: route.path,
              builder: (BuildContext context, GoRouterState state) => route.buildPage(),
            ))
        .toList(),
  );
}
