import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:codwise/app/router.dart';
import 'package:codwise/constants.dart';

class CodwiseApp extends StatelessWidget {
  CodwiseApp({Key? key}) : super(key: key);

  final GoRouter _router = createGoRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: AppFonts.poppins),
      title: AppStrings.appName,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
