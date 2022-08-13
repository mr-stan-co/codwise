import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:wise_dev/pages/about/viewmodel/about_state.dart';
import 'package:wise_dev/pages/home/viewmodel/home_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(const AboutState());

}
