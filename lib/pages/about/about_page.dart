import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:wise_dev/pages/home/view/home_page_view.dart';
import 'package:wise_dev/pages/home/viewmodel/home_cubit.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("About page"),
    );
  }
}
