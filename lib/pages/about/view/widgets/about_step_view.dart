import 'package:flutter/material.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/about/viewmodel/about_step.dart';

class AboutStepView extends StatelessWidget {
  const AboutStepView({
    Key? key,
    required this.step,
  }) : super(key: key);

  final AboutStep step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: step.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            _stepIcon(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                step.title,
                style: TextStyle(
                  color: step.titleTextColor,
                  fontSize: 36,
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              step.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: AppFonts.poppins,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepIcon() {
    return SizedBox(
      height: 124,
      width: 124,
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
            fontSize: 48,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
