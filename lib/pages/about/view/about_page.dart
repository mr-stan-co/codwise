import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:codwise/pages/about/view/about_page_view.dart';
import 'package:codwise/pages/about/viewmodel/about_cubit.dart';
import 'package:codwise/pages/home/view/home_page_view.dart';
import 'package:codwise/pages/home/viewmodel/home_cubit.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit(),
      child: const AboutPageView(),
    );
  }
}
