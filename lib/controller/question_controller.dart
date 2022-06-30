import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/screen/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
      )
      .toList();

  Animation get animation => _animation;
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get inAnswered => _isAnswered;

  int _correntAns = 0;
  int get correctAns => _correntAns;

  int _selectAns = 0;
  int get selectedAns => _selectAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correntAns = question.answer;
    _selectAns = selectedIndex;

    if (_correntAns == _selectAns) _numOfCorrectAns++;
    _animationController.stop();
    update();
    Future.delayed(Duration(milliseconds: 150), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.off(ScoreScreen(
          numOfQuestions: questions.length, numOfCorrectAns: numOfCorrectAns));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
