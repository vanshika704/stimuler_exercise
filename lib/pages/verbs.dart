import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerbsQuizScreen extends StatefulWidget {
  @override
  _VerbsQuizScreenState createState() => _VerbsQuizScreenState();
}

class _VerbsQuizScreenState extends State<VerbsQuizScreen> {
  int currentQuestionIndex = 0; // Tracks the current question
  int correctAnswers = 0; // Tracks the number of correct answers
  int? selectedOption; // Tracks the selected option index
  bool isAnswerChecked = false; // Flag to check if the answer is verified
  bool quizCompleted = false; // Flag to check if the quiz is completed

  // Questions for Day 6 - Verbs
  final List<Map<String, dynamic>> questions = [
    {
      "exercise": "Exercise 1: Perfect Progressive Tenses",
      "question":
          "By next year, the scientists _ on this project for a decade.",
      "options": [
        "will have been working",
        "will be working",
        "would have been working",
        "would be working"
      ],
      "answerIndex": 0,
      "image": "assets/perfect_progressive1.png",
    },
    {
      "exercise": "Exercise 1: Perfect Progressive Tenses",
      "question":
          "The AI system _ increasingly complex patterns before the anomaly was detected.",
      "options": [
        "had been recognizing",
        "has been recognizing",
        "was recognizing",
        "is recognizing"
      ],
      "answerIndex": 0,
      "image": "assets/perfect_progressive2.png",
    },
    {
      "exercise": "Exercise 2: Modal Perfect Verbs",
      "question":
          "The experiment _ different results if the temperature had been controlled more precisely.",
      "options": ["might yield", "might have yielded", "must yield", "must have yielded"],
      "answerIndex": 1,
      "image": "assets/modal_perfect1.png",
    },
    {
      "exercise": "Exercise 2: Modal Perfect Verbs",
      "question":
          "The research team _ the deadline, but the equipment malfunction caused delays.",
      "options": ["could meet", "could have met", "should meet", "should have met"],
      "answerIndex": 1,
      "image": "assets/modal_perfect2.png",
    },
    {
      "exercise": "Exercise 3: Subjunctive Mood",
      "question": "The ethics committee recommended that the study _ immediately.",
      "options": ["be terminated", "is terminated", "was terminated", "were terminated"],
      "answerIndex": 0,
      "image": "assets/subjunctive1.png",
    },
    {
      "exercise": "Exercise 3: Subjunctive Mood",
      "question": "The professor suggested that each student _ their own research methodology.",
      "options": ["develops", "developed", "develop", "has developed"],
      "answerIndex": 2,
      "image": "assets/subjunctive2.png",
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
          "Day 6 - Verbs",
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
              Image.asset(
                currentQuestion["image"],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 140,
              ),
              const SizedBox(height: 16),
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
