import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnwsers, required this.switchScreen});
  final List<String> chosenAnwsers;
  final void Function(String? text) switchScreen;

  List<Map<String, Object>> getSumaryData() {
    List<Map<String, Object>> sumary = [];
    for (var i = 0; i < chosenAnwsers.length; i++) {
      sumary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnwsers[i]
      });
    }
    return sumary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSumaryData();
    final numberOfQuestions = questions.length;
    final numberOfCorrectAnswser = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $numberOfCorrectAnswser out of $numberOfQuestions  questions corretly",
                style: const TextStyle(
                    color: Color.fromARGB(255, 238, 142, 255), fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              QuestionsSummary(sumaryData: summaryData),
              const SizedBox(
                height: 40,
              ),
              TextButton.icon(
                onPressed: () {
                  switchScreen("start");
                },
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                label: const Text("restart Quiz"),
                icon: const Icon(Icons.restart_alt_rounded),
              ),
            ],
          ),
        ));
  }
}
