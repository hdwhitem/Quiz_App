import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightBlueAccent),
              child: GetBuilder<QuestionController>(
                  init: QuestionController(),
                  builder: (controller) {
                    return Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) => Container(
                            width: constraints.maxWidth *
                                controller.animation.value,
                            decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        Positioned.fill(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${(controller.animation.value * 30).round()} Sec"),
                              const Icon(
                                Icons.timer_sharp,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ))
                      ],
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
