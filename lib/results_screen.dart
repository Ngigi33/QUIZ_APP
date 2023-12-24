import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary.dart';

class Resultsscreen extends StatelessWidget {
  const Resultsscreen(
      {super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'Question_index': i,
          'Question': questions[i].question,
          'Correct_answer': questions[i].answers[0],
          'User_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final dataSummary = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = dataSummary
        .where((data) => data['User_answer'] == data['Correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions correctly',
                  style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white),
                  fontSize:20,
                  fontWeight: FontWeight.w900
                  ),
                  ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summarydata: dataSummary),
              const SizedBox(height: 40,),
              TextButton.icon(
                onPressed: onRestartQuiz,
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: const Color.fromARGB(224, 126, 165, 232)),
                icon: const Icon(Icons.replay_sharp),
                label: Text('Restart Quiz!',
                    style: GoogleFonts.roboto(
                      textStyle:
                          const TextStyle(color: Colors.white70, fontSize: 21),
                    )),
              )
            ]),
      ),
    );
  }
}
