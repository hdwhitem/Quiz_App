import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/widget/option.dart';
import '../widget/progress_bar.dart';
import '../widget/question_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionController questionController = Get.put(QuestionController());
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: ProgressBar()),
                const SizedBox(height: kDefaultPadding),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Obx(
                      () => Text.rich(
                        TextSpan(
                          text:
                              "Question ${questionController.questionNumber.value}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "/${questionController.questions.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )),
                const Divider(thickness: 2.5),
                const SizedBox(height: kDefaultPadding),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: questionController.pageController,
                    onPageChanged: questionController.updateTheQnNum,
                    itemCount: questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                      question: questionController.questions[index],
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding)
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
