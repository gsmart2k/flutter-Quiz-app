import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: (Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(231, 92, 91, 91),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Learn Flutter the fun way !',
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: const Color.fromARGB(255, 68, 12, 113)),
            icon: const Icon(Icons.arrow_forward_sharp),
            label: const Text('Start Quiz'),
          )
        ],
      )),
    );
  }
}
