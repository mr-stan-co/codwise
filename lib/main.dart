import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wise_dev/app/wise_dev_app.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(WiseDevApp());
}
