import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
//import 'package:quiz_app/model/question_model.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
 
  final  Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionState();
  }
}


class _QuestionState extends State<QuestionsScreen> {
  var j = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      j++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[j];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Colors.white),
                  fontSize: 20,
                  fontWeight: FontWeight.bold  
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((answers) {
              return AnswerButton(
                answerText: answers,
                onTap:(){
                  answerQuestion(answers); 
                }
                //answerQuestion, //we use answerQuestion without () because it is used as a pointer to the function above
              );
            }),
          ],
        ),
      ),
    );
  }
}
