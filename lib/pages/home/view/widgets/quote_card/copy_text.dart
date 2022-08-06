import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wise_dev/constants.dart';

class CopyText extends StatelessWidget {
  const CopyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.copy,
            color: AppColors.accentColor,
            size: 24,
          ),
        ),
        Text(
          "Copy text",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
