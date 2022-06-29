import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screen/score_screen.dart';
import 'package:quiz_app/screen/startplaying_screen.dart';

import 'screen/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StartPlaying(),
    );
  }
}
