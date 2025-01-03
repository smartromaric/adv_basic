import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 400,
            color: const Color.fromARGB(132, 255, 255, 255),
          ),
          const SizedBox(height: 70),
          Text(
            "Learn Flutter the fun way",
            style: GoogleFonts.lato(
                fontSize: 30, color: const Color.fromARGB(255, 222, 142, 253)),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_right),
            label: const Text(
              "Start quiz",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
