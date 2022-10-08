import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:codwise/constants.dart';
import 'package:codwise/pages/about/view/widgets/about_step_view.dart';
import 'package:codwise/pages/about/viewmodel/about_step.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';

class AboutSteps extends StatelessWidget {
  const AboutSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    return isSmallScreen ? _mobileSteps(isSmallScreen) : _desktopSteps(isSmallScreen);
  }

  Widget _desktopSteps(bool isSmallScreen) {
    return Column(
      children: [
        _stepsTitle(isSmallScreen),
        _stepsDesktop(),
        _stepsFooter(isSmallScreen),
        const SizedBox(
          height: 64,
        ),
      ],
    );
  }

  Widget _mobileSteps(bool isSmallScreen) {
    return Column(
      children: [
        _stepsTitle(isSmallScreen),
        const AboutStepView(step: AboutStep.first),
        const SizedBox(
          height: 16,
        ),
        const AboutStepView(step: AboutStep.second),
        const SizedBox(
          height: 16,
        ),
        const AboutStepView(step: AboutStep.third),
        _stepsFooter(isSmallScreen),
        const SizedBox(
          height: 64,
        ),
      ],
    );
  }

  Widget _stepsTitle(bool isSmallScreen) {
    final double titleFontSize = isSmallScreen ? 20 : 42;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: "Start using ",
          style: TextStyle(
            fontSize: titleFontSize,
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

  Widget _stepsDesktop() {
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

  Widget _stepsFooter(bool isSmallScreen) {
    final double iconSize = isSmallScreen ? 24 : 36;
    final double footerFontSize = isSmallScreen ? 16 : 24;

    final footerIcon = Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: SvgPicture.asset('assets/images/repeat.svg'),
      ),
    );
    final footerText = Text(
      "And repeat. The quote is updated every day!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: footerFontSize,
      ),
    );
    if (isSmallScreen) {
      return Column(
        children: [
          footerIcon,
          footerText,
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          footerIcon,
          footerText,
        ],
      );
    }
  }
}
