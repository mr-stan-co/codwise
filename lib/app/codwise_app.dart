import 'package:codwise/app/router.dart';
import 'package:codwise/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodwiseApp extends StatefulWidget {
  const CodwiseApp({Key? key}) : super(key: key);

  @override
  State<CodwiseApp> createState() => _CodwiseAppState();
}

class _CodwiseAppState extends State<CodwiseApp> {
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
