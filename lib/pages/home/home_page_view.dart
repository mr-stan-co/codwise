import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMMEEEEd().add_Hm().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(title: const Text("Wise Dev"),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(fontSize: 24),
            ),
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                "A good programmer is someone who always looks both ways before crossing a one-way street.",
                style: TextStyle(fontSize: 42),
              ),
            ),
            const Text(
              "Doug Linder",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
