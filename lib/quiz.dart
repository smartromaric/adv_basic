import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/gradient_container.dart';
import 'package:adv_basic/question_screen.dart';
import 'package:adv_basic/result_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  final List<String> chooseQuestions = [];

  @override
  void initState() {
    currentScreen = GradientContainer(switchScreen);
    super.initState();
  }

  void switchScreen([String? text = "question"]) {
    if (text == "question") {
      setState(() {
        currentScreen = QuestionScreen(selectAnswer: onselectAnswer);
      });
    } else if (text == "start") {
      chooseQuestions.clear();
      setState(() {
        currentScreen = GradientContainer(switchScreen);
      });
    }
  }

  void onselectAnswer(String answer) {
    print(chooseQuestions);
    if (chooseQuestions.length == questions.length - 1) {
      setState(() {
        currentScreen = ResultScreen(
          chosenAnwsers: chooseQuestions,
          switchScreen: switchScreen,
        );
      });
    }

    chooseQuestions.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 79, 16, 90),
              gradient: LinearGradient(
                  colors: [Colors.purple, Color.fromARGB(255, 79, 16, 90)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: currentScreen,
        ),
      ),
    );
  }
}
