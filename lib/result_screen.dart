import 'package:flutter/material.dart';
import 'package:quizapp/data/quiz_question.dart';
import 'package:quizapp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return (SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly !',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(getSummaryData()),
              const SizedBox(
                height: 40,
              ),
              TextButton.icon(
                  onPressed: onRestart,
                  icon:
                      const Icon(Icons.refresh, color: Colors.white, size: 30),
                  label: const Text(
                    'Restart Quiz!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          )),
    ));
  }
}
