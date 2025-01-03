import 'package:adv_basic/answer_button.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectAnswer});
  final void Function(String answer) selectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQestionIndex = 0;

  void answerQuestion(String answer) {
    widget.selectAnswer(answer);
    if (currentQestionIndex < questions.length) {
      currentQestionIndex += 1;
    } else {
      currentQestionIndex = 0;
    }
    setState(() {
      currentQestionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[currentQestionIndex];
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textAlign: TextAlign.center,
          question.text,
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 203, 130, 245),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        ...question.getShuffleAnswer().map((answer) {
          return AnswerButton(
              title: answer,
              action: () {
                answerQuestion(answer);
              });
        })
      ],
    ));
  }
}
