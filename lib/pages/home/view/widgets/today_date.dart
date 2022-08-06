import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wise_dev/constants.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMMEEEEd().format(DateTime.now());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.calendar_today,
              color: AppColors.accentColor,
              size: 24,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          date,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
