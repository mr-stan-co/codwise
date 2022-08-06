import 'package:flutter/material.dart';
import 'package:wise_dev/constants.dart';

class CopyTextToast extends StatelessWidget {
  const CopyTextToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.black,
      ),
      child: Text(
        "Copied",
        style: TextStyle(
          color: AppColors.white,
        ),
      ),
    );
  }
}
