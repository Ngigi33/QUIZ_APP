import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    //border: Border.all(width: 0),
                    shape: BoxShape.circle,
                    color: Color.fromARGB(159, 255, 214, 64),
                  ),
                  child: Center(
                    child: Text(
                      ((data['Question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          data['Question'] as String,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(color: Colors.white),
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['Correct_answer'] as String,
                          style: GoogleFonts.roboto(
                              textStyle:
                                  const TextStyle(color: Colors.white60),
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          data['User_answer'] as String,
                          style: GoogleFonts.roboto(
                              textStyle:
                                  const TextStyle(color: Color.fromARGB(125, 1, 101, 148)),
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
