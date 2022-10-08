import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:codwise/pages/about/view/about_page.dart';
import 'package:codwise/pages/home/view/home_page.dart';

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
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      RegisteredRoutes.home,
      RegisteredRoutes.about,
    ]
        .map((route) => GoRoute(
              path: route.path,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: route.buildPage(),
              ),
            ))
        .toList(),
  );
}
