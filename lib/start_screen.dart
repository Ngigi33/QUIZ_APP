import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(141, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Learn Flutter the fun way !',
            style:GoogleFonts.roboto(
            textStyle: const TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
            fontSize: 26,
            fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
              onPressed:startQuiz,
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(117, 154, 245, 222)),
              icon: const Icon(Icons.play_arrow),
              label: const Text(
                'START QUIZ',
              )),
        ],
      ),
    );
  }
}

 