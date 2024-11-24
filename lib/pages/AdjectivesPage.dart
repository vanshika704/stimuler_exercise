import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class AdjectivesScreen extends StatefulWidget {
  @override
  _AdjectivesScreenState createState() => _AdjectivesScreenState();
}

class _AdjectivesScreenState extends State<AdjectivesScreen> {
  int currentQuestionIndex = 0; // Tracks the current question
  int correctAnswers = 0; // Tracks the number of correct answers
  int? selectedOption; // Tracks the selected option index
  bool isAnswerChecked = false; // Flag to check if the answer is verified
  bool quizCompleted = false; // Flag to check if the quiz is completed

  // Questions, options, answers, and corresponding images
  final List<Map<String, dynamic>> questions = [
    {
      "question":
          "The company implemented a _ security protocol for their data centers.",
      "options": ["cutting-edge", "cutting edge", "edge-cutting", "edge cutting"],
      "answerIndex": 0,
      "image": "assets/ad1.png",
    },
    {
      "question":
          "The physicist presented a _ theory about quantum entanglement.",
      "options": ["ground breaking", "ground-breaking", "breaking-ground", "break-grounding"],
      "answerIndex": 1,
      "image": "assets/ad2.jpg",
    },
    {
      "question":
          "The expedition required _ equipment for the harsh Antarctic conditions.",
      "options": ["military grade", "military-grade", "grade-military", "grade military"],
      "answerIndex": 1,
      "image": "assets/ad3.webp",
    },
    {
      "question":
          "The _ evidence presented at the trial changed the jury's perspective.",
      "options": ["overwhelming", "overwhelmed", "overwhelm", "overwhelms"],
      "answerIndex": 0,
      "image": "assets/ad4.webp",
    },
    {
      "question":
          "The archaeologists discovered a _ manuscript in the ancient temple.",
      "options": ["fascinated", "fascinating", "fascinate", "fascinates"],
      "answerIndex": 1,
      "image": "assets/ad5.jpg",
    },
    {
      "question":
          "She purchased a _ briefcase for her new job.",
      "options": ["leather expensive Italian", "Italian expensive leather", "expensive Italian leather", "expensive leather Italian"],
      "answerIndex": 2,
      "image": "assets/ad6.png",
    },
    {
      "question":
          "The museum displayed a _ artifact from the Ming Dynasty.",
      "options": ["porcelain ancient valuable", "valuable ancient porcelain", "ancient valuable porcelain", "porcelain valuable ancient"],
      "answerIndex": 1,
      "image": "assets/ad7.png",
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
            backgroundColor: const Color.fromARGB(255, 137, 57, 51),
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0 ),
            child: Icon(Icons.more_vert, color: Colors.white),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(12.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
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
                              : const Color.fromARGB(255, 137, 57, 51))
                          : Color.fromARGB(255, 102, 57, 166))
                      : Color.fromARGB(255, 102, 57, 166),
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
