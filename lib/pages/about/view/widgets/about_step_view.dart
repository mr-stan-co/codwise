import 'package:flutter/material.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/about/viewmodel/about_step.dart';
import 'package:wise_dev/pages/view_utils/screen_size_util.dart';

class AboutStepView extends StatelessWidget {
  const AboutStepView({
    Key? key,
    required this.step,
  }) : super(key: key);

  final AboutStep step;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    final double stepTitleSize = isSmallScreen ? 24 : 36;
    final double stepDescriptionSize = isSmallScreen ? 16 : 24;
    return Container(
      decoration: BoxDecoration(
        color: step.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            _stepIcon(isSmallScreen),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                step.title,
                style: TextStyle(
                  color: step.titleTextColor,
                  fontSize: stepTitleSize,
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              step.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: stepDescriptionSize,
                fontFamily: AppFonts.poppins,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepIcon(bool isSmallScreen) {
    final double iconSize = isSmallScreen ? 64 : 124;
    final double fontSize = isSmallScreen ? 32 : 48;
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: step.bgAccentColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          "${step.index + 1}",
          style: TextStyle(
            color: step.titleTextColor,
            fontSize: fontSize,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
