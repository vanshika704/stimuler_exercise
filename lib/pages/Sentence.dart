import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentenceStructureQuizScreen extends StatefulWidget {
  @override
  _SentenceStructureQuizScreenState createState() =>
      _SentenceStructureQuizScreenState();
}

class _SentenceStructureQuizScreenState
    extends State<SentenceStructureQuizScreen> {
  int currentQuestionIndex = 0; // Tracks the current question
  int correctAnswers = 0; // Tracks the number of correct answers
  int? selectedOption; // Tracks the selected option index
  bool isAnswerChecked = false; // Flag to check if the answer is verified
  bool quizCompleted = false; // Flag to check if the quiz is completed

  // Questions for Day 5 - Sentence Structure
  final List<Map<String, dynamic>> questions = [
    {
      "exercise": "Exercise 1: Inverted Sentence Structures",
      "question":
          "_ the revolutionary technology that the potential for clean energy became apparent.",
      "options": [
        "Not until the scientists developed",
        "Until the scientists developed",
        "The scientists developed until",
        "Developed the scientists until"
      ],
      "answerIndex": 0,
      "image": "assets/inverted1.png",
    },
    {
      "exercise": "Exercise 1: Inverted Sentence Structures",
      "question":
          "_ the complex theories of quantum physics lies a simple mathematical principle.",
      "options": ["Beneath", "Under", "Below", "Underneath of"],
      "answerIndex": 0,
      "image": "assets/inverted2.png",
    },
    {
      "exercise": "Exercise 2: Parallel Structure in Complex Sentences",
      "question":
          "The research involved _ data, analyzing statistical patterns, and presenting conclusions.",
      "options": ["to collect", "collecting", "collection of", "collected"],
      "answerIndex": 1,
      "image": "assets/parallel1.png",
    },
    {
      "exercise": "Exercise 2: Parallel Structure in Complex Sentences",
      "question":
          "The CEO's strategy was _, innovative, and transformative.",
      "options": ["being bold", "to be bold", "bold", "boldly"],
      "answerIndex": 2,
      "image": "assets/parallel2.png",
    },
  ];

  // Function to handle the answer checking
  void checkAnswer() {
    setState(() {
      isAnswerChecked = true;
      if (selectedOption == questions[currentQuestionIndex]["answerIndex"]) {
        correctAnswers++;
      } else {
        // Show Snackbar with the correct answer
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Wrong! The correct answer is: ${questions[currentQuestionIndex]["options"][questions[currentQuestionIndex]["answerIndex"]]}',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 231, 84, 74),
            duration: const Duration(seconds: 2),
          ),
        );
      }

      // Only move to the next question if the answer is correct
      if (selectedOption == questions[currentQuestionIndex]["answerIndex"]) {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          selectedOption = null;
          isAnswerChecked = false;
        } else {
          quizCompleted = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Quiz Completed! Unlocking next topic...',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 12, 19),
      appBar: AppBar(
        title: Text(
          "Day 5 - Sentence Structure",
          style: GoogleFonts.quicksand(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 11, 12, 19),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: correctAnswers / questions.length,
            color: Colors.green,
            backgroundColor: Colors.grey.shade800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                currentQuestion["exercise"],
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                currentQuestion["question"],
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Image.asset(
              //   currentQuestion["image"],
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: 140,
              // ),
              const SizedBox(height: 150),
              // Wrap the options in an expanded container
              ...List.generate(
                currentQuestion["options"].length,
                (index) => Expanded(
                  child: _buildOption(
                    currentQuestion["options"][index],
                    index,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: selectedOption != null ? checkAnswer : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedOption != null
                      ? const Color.fromARGB(255, 135, 69, 226)
                      : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  "Check Answer",
                  style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom option builder
  Widget _buildOption(String text, int index) {
    final isSelected = selectedOption == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
          isAnswerChecked = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 135, 69, 226) : Colors.transparent,
          border: Border.all(color: isSelected ? Colors.green : Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
