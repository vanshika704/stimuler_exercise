import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ConjunctionsScreen extends StatefulWidget {
  @override
  _ConjunctionsScreenState createState() => _ConjunctionsScreenState();
}

class _ConjunctionsScreenState extends State<ConjunctionsScreen> {
  int currentQuestionIndex = 0; // Tracks the current question
  int correctAnswers = 0; // Tracks the number of correct answers
  int? selectedOption; // Tracks the selected option index
  bool isAnswerChecked = false; // Flag to check if the answer is verified
  bool quizCompleted = false; // Flag to check if the quiz is completed

  // Questions, options, answers, and corresponding images
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "_ did the research paper receive acclaim for its methodology, _ it was praised for its innovative conclusions.",
      "options": ["Not only / but also", "Either / or", "Neither / nor", "Both / and"],
      "answerIndex": 0,
      "image": "assets/ad1.png",
    },
    {
      "question":
          "_ the quantum theory _ the string theory could fully explain the observed phenomena.",
      "options": ["Both / and", "Either / or", "Neither / nor", "Not only / but also"],
      "answerIndex": 2,
      "image": "assets/ad2.jpg",
    },
    {
      "question":
          "The experiment yielded unexpected results _ the researchers followed the protocol precisely.",
      "options": ["although", "because", "unless", "if"],
      "answerIndex": 0,
      "image": "assets/ad3.webp",
    },
    {
      "question":
          "The archaeological team will continue excavating _ they find evidence of the ancient civilization.",
      "options": ["unless", "until", "while", "whereas"],
      "answerIndex": 1,
      "image": "assets/ad4.webp",
    },
  ];

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

      // Move to the next question after checking the answer
      if (selectedOption == questions[currentQuestionIndex]["answerIndex"]) {
        // Increment question index if answer is correct
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          selectedOption = null;  // Reset the selected option
          isAnswerChecked = false; // Reset answer checked status
        } else {
          Get.toNamed("/");
          quizCompleted = true;
          // Unlock next node here if all questions are answered
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Quiz Completed! Unlocking next node...',
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
        backgroundColor: const Color.fromARGB(255, 11, 12, 19),
        elevation: 0,
        title: Text(
          "Grammar Quiz",
          style: GoogleFonts.quicksand(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.more_vert, color: Colors.white),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: LinearProgressIndicator(
                value: correctAnswers / questions.length,
                color: Colors.green,
                backgroundColor: Colors.grey.shade800,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question ${currentQuestionIndex + 1}",
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 16),
              Text(
                currentQuestion["question"],
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  currentQuestion["image"],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 140, // Limit image height for better fit
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: List.generate(
                  currentQuestion["options"].length,
                  (index) => _buildOption(
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
                      ? (isAnswerChecked
                          ? (selectedOption ==
                                  currentQuestion["answerIndex"]
                              ? Colors.green
                              : const Color.fromARGB(255, 239, 100, 91))
                          : const Color.fromARGB(255, 135, 69, 226))
                      : const Color.fromARGB(255, 135, 69, 226),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  isAnswerChecked
                      ? (selectedOption == currentQuestion["answerIndex"]
                          ? "Correct!"
                          : "That Wasn't right!")
                      : "Check Answer",
                  style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String text, int index) {
    final isSelected = selectedOption == index;
    final isCorrect =
        index == questions[currentQuestionIndex]["answerIndex"] && isAnswerChecked;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
          isAnswerChecked = false; // Reset answer checked status
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 135, 69, 226) : Colors.transparent, // Purple if selected
          border: Border.all(
            color: isSelected
                ? (isCorrect ? Colors.green : const Color.fromARGB(255, 135, 69, 226))
                : const Color.fromARGB(255, 71, 70, 70), // Border color based on correctness or selection
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(
              "${String.fromCharCode(97 + index)}. ", // Option number (a, b, c, d)
              style: GoogleFonts.quicksand(
                color: Colors.white, // Consistent text color
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
