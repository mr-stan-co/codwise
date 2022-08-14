import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wise_dev/app/router.dart';

class WiseDevApp extends StatelessWidget {
  WiseDevApp({Key? key}) : super(key: key);

  final GoRouter _router = createGoRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Poppins'),
      title: 'Wise Dev',
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
