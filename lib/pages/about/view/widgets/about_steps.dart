import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/about/view/widgets/about_step_view.dart';
import 'package:wise_dev/pages/about/viewmodel/about_step.dart';

class AboutSteps extends StatelessWidget {
  const AboutSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _stepsTitle(),
        _steps(),
        _stepsFooter(),
        const SizedBox(height: 64,),
      ],
    );
  }

  Widget _stepsTitle() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: "Start using ",
          style: const TextStyle(
            fontSize: 42,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          children: [
            const TextSpan(
              text: AppStrings.appName,
              style: TextStyle(
                color: AppColors.accentColor,
              ),
            ),
            TextSpan(
              text: " in ${AboutStep.values.length} simple steps:",
              style: const TextStyle(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _steps() {
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

  Widget _stepsFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 36,
          height: 36,
          child: SvgPicture.asset('assets/images/repeat.svg'),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "And repeat. The quote is updated every day!",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
