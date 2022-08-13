import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/about/view/widgets/about_main_title.dart';
import 'package:wise_dev/pages/about/view/widgets/about_step_view.dart';
import 'package:wise_dev/pages/about/viewmodel/about_cubit.dart';
import 'package:wise_dev/pages/about/viewmodel/about_state.dart';
import 'package:wise_dev/pages/about/viewmodel/about_step.dart';
import 'package:wise_dev/pages/main_app_bar.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const MainAppBar(),
          backgroundColor: AppColors.aboutBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _aboutHeader(state),
                _aboutFeatures(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _aboutHeader(AboutState state) {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          _aboutLeftView(state),
          const Spacer(flex: 2),
          _aboutRightView(state),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _aboutLeftView(AboutState state) {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AboutMainTitle(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              state.aboutText,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: AppFonts.poppins,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutRightView(AboutState state) {
    return Expanded(
      flex: 7,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 200,
                child: SvgPicture.asset('assets/images/quote_icon.svg'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: AboutMainTitle(),
                ),
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: state.quoteText1,
                  style: const TextStyle(
                    fontSize: 36,
                    fontFamily: AppFonts.playfairDisplay,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: state.quoteText2,
                      style: const TextStyle(
                        color: AppColors.accentColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                state.quoteAuthor,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: AppFonts.poppins,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _aboutFeatures() {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Spacer(),
          Expanded(
            flex: 5,
            child: AboutStepView(step: AboutStep.first),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: AboutStepView(step: AboutStep.second),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: AboutStepView(step: AboutStep.third),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
