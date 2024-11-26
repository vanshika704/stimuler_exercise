// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../controllers/quiz.dart';

// class DailyQuizScreen extends StatelessWidget {
//   final QuizController controller = Get.put(QuizController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 11, 12, 19),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 11, 12, 19),
//         title: Obx(() => Text(
//               "Exercise: ${controller.currentExercise}",
//               style: GoogleFonts.quicksand(color: Colors.white),
//             )),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(12.0),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(50.0),
//               child: LinearProgressIndicator(
//                 value: controller.correctAnswers.value /
//                     controller.currentExerciseQuestions.length,
//                 color: Colors.green,
//                 backgroundColor: Colors.grey.shade800,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Obx(() {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Add an image above the options
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Image.network(
//                 controller.currentQuestion["imageUrl"] ?? 'https://via.placeholder.com/150',
//                 height: 200.0,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),

//             // Question label
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 "Question ${controller.currentQuestionIndex.value + 1}:",
//                 style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18),
//               ),
//             ),

//             // Question text
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 controller.currentQuestion["question"] ?? '',
//                 style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
//               ),
//             ),

//             // Answer options
//             ...List.generate(
//               controller.currentQuestion["options"].length,
//               (index) => GestureDetector(
//                 onTap: () => controller.selectedOption.value = index,
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: controller.selectedOption.value == index
//                         ? const Color.fromARGB(255, 135, 69, 226)
//                         : Colors.transparent,
//                     border: Border.all(
//                       color: controller.selectedOption.value == index
//                           ? const Color.fromARGB(255, 135, 69, 226)
//                           : Colors.grey,
//                       width: 2.0,
//                     ),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   height: 60.0, // Set a fixed height for the options to make them equal
//                   child: Text(
//                     "${String.fromCharCode(97 + index)}. ${controller.currentQuestion["options"][index]}",
//                     style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // Submit button
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: controller.selectedOption.value != null
//                     ? controller.nextQuestion
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 135, 69, 226),
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: Text(
//                   "Submit Answer",
//                   style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/quiz.dart';

class DailyQuizScreen extends StatelessWidget {
  final QuizController controller = Get.put(QuizController());
  final List<String> topics = [
    "Adjectives",
    "Adverbs",
    "Conjunctions",
    "Prefix and Suffix",
    "Sentence Formation",
    "Verbs"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 12, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 12, 19),
        title: Obx(() => Text(
              "Exercise: ${controller.currentExercise}",
              style: GoogleFonts.quicksand(color: Colors.white),
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(12.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: LinearProgressIndicator(
                value: controller.correctAnswers.value /
                    controller.currentExerciseQuestions.length,
                color: Colors.green,
                backgroundColor: Colors.grey.shade800,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView( // Allow scrolling if the content overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question label
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Question ${controller.currentQuestionIndex.value + 1}:",
                  style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18),
                ),
              ),

              // Question text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  controller.currentQuestion["question"] ?? '',
                  style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
                ),
              ),

              // Image below the question
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  // Get the current topic name
                  String currentTopic = topics[controller.currentExerciseIndex.value];
                  String imagePath = 'assets/${currentTopic.toLowerCase()}.png';

                  // Show image, with fallback if not found
                  return Image.asset(
                    imagePath,
                    height: 120.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Show default image if error occurs
                      return Image.asset(
                        'assets/default_image.png', // Your default image path
                        height: 120.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }),
              ),

              // Answer options
              ...List.generate(
                controller.currentQuestion["options"].length,
                (index) => GestureDetector(
                  onTap: () => controller.selectedOption.value = index,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity, // This ensures the option takes full width
                    decoration: BoxDecoration(
                      color: controller.selectedOption.value == index
                          ? const Color.fromARGB(255, 135, 69, 226)
                          : Colors.transparent,
                      border: Border.all(
                        color: controller.selectedOption.value == index
                            ? const Color.fromARGB(255, 135, 69, 226)
                            : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 60.0, // Set a fixed height for the options to make them equal
                    child: Text(
                      "${String.fromCharCode(97 + index)}. ${controller.currentQuestion["options"][index]}",
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              // Submit button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: controller.selectedOption.value != null
                      ? controller.nextQuestion
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 135, 69, 226),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Submit Answer",
                    style: GoogleFonts.quicksand(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
