import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:quiz_app/controller/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen(
      {Key? key, required this.numOfCorrectAns, required this.numOfQuestions})
      : super(key: key);

  final int numOfCorrectAns;
  final int numOfQuestions;

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const Spacer(flex: 3),
              Text("Score", style: Theme.of(context).textTheme.headline3),
              const Spacer(),
              Text("${numOfCorrectAns}/${numOfQuestions}",
                  style: Theme.of(context).textTheme.headline4),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
