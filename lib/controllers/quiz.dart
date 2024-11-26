
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:exerciseapp/components/quizdata.dart';

// class QuizController extends GetxController {
//   var currentDay = "Day 1".obs; // The current day
//   var currentExerciseIndex = 0.obs;
//   var currentQuestionIndex = 0.obs;
//   var correctAnswers = 0.obs;
//   var selectedOption = Rxn<int>(); // The selected option for a question
//   var isAnswerChecked = false.obs;
//   var unlockedDays = ["Day 1"].obs; // List of unlocked days

//   // Fetch the questions for the current exercise
//   List<Map<String, dynamic>> get currentExerciseQuestions {
//     var dayData = QuizData.questions[currentDay.value];
//     if (dayData != null) {
//       var exerciseData = dayData[currentExerciseIndex.value];
//       var questions = exerciseData["questions"];
//       if (questions != null && questions is List<Map<String, dynamic>>) {
//         return questions;
//       }
//     }
//     return []; // Return empty list if no questions
//   }

//   // Get the current exercise name
//   String get currentExercise {
//     var dayData = QuizData.questions[currentDay.value];
//     if (dayData != null) {
//       var exerciseData = dayData[currentExerciseIndex.value];
//       var exercise = exerciseData["exercise"];
//       if (exercise != null && exercise is String) {
//         return exercise;
//       }
//     }
//     return ""; // Return empty string if no exercise
//   }

//   // Get the current question
//   Map<String, dynamic> get currentQuestion {
//     return currentExerciseQuestions.isNotEmpty
//         ? currentExerciseQuestions[currentQuestionIndex.value]
//         : {}; // Empty map if no questions
//   }

//   // Check if the selected answer is correct, show feedback, and move to the next question
//   void checkAnswer() {
//     isAnswerChecked.value = true;
//     if (selectedOption.value == currentQuestion["answerIndex"]) {
//       correctAnswers.value++;
//       // If the answer is correct, show feedback
//       Get.snackbar(
//         "Correct Answer",
//         "Well done! You chose the correct answer.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color.fromARGB(255, 55, 110, 57),
//         colorText: Colors.white,
//         duration: const Duration(seconds: 2),
//       );
//     } else {
//       // Show Snackbar with the correct answer
//       Get.snackbar(
//         "Wrong Answer",
//         "The correct answer is: ${currentQuestion["options"][currentQuestion["answerIndex"]]}",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color.fromARGB(255, 137, 57, 51),
//         colorText: Colors.white,
//         duration: const Duration(seconds: 2),
//       );
//     }
//   }

//   // Move to the next question or exercise
//   void nextQuestion() {
//     if (selectedOption.value == null) {
//       // Don't proceed if no option is selected
//       Get.snackbar(
//         "Please select an answer",
//         "You need to choose an answer to proceed.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color.fromARGB(255, 137, 57, 51),
//         colorText: Colors.white,
//         duration: const Duration(seconds: 2),
//       );
//       return;
//     }

//     checkAnswer(); // Check the current answer before moving forward

//     // If the answer is correct, move to the next question or exercise
//     if (selectedOption.value == currentQuestion["answerIndex"]) {
//       // Check if there are more questions in the current exercise
//       if (currentQuestionIndex.value < currentExerciseQuestions.length - 1) {
//         currentQuestionIndex.value++;
//         selectedOption.value = null;
//         isAnswerChecked.value = false;
//       } else if (currentExerciseIndex.value < QuizData.questions[currentDay.value]!.length - 1) {
//         // Move to the next exercise if available
//         currentExerciseIndex.value++;
//         currentQuestionIndex.value = 0;
//       } else {
//         // Quiz complete, navigate to home screen
//         completeQuiz();
//       }
//     } else {
//       // Block navigation if the answer is wrong
//       Get.snackbar(
//         "Wrong Answer",
//         "Please try again after selecting the correct answer.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color.fromARGB(255, 137, 57, 51),
//         colorText: Colors.white,
//         duration: const Duration(seconds: 2),
//       );
//     }
//   }

//   // Complete the quiz and unlock next day
//   void completeQuiz() {
//     // Mark current day as complete and unlock next day
//     unlockNextDay();
//     Get.snackbar(
//       "Exercise Complete",
//       "You scored ${correctAnswers.value}!",
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: const Color.fromARGB(255, 55, 110, 57),
//       colorText: Colors.white,
//     );
//     // Navigate back to the home screen after all exercises are completed
//     Get.toNamed("/"); // Navigate to home page
//   }

//   // Unlock the next day if available
//   void unlockNextDay() {
//     var days = QuizData.questions.keys.toList();
//     var currentIndex = days.indexOf(currentDay.value);

//     if (currentIndex < days.length - 1) {
//       var nextDay = days[currentIndex + 1];
//       if (!unlockedDays.contains(nextDay)) {
//         unlockedDays.add(nextDay);
//       }
//     }
//   }

//   // Check if a day is unlocked
//   bool isDayUnlocked(String day) {
//     return unlockedDays.contains(day);
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exerciseapp/components/quizdata.dart';

class QuizController extends GetxController {
  var currentDay = "Day 1".obs;
  var currentExerciseIndex = 0.obs;
  var currentQuestionIndex = 0.obs;
  var correctAnswers = 0.obs;
  var selectedOption = Rxn<int>();
  var isAnswerChecked = false.obs;
  var unlockedDays = ["Day 1"].obs;

  List<Map<String, dynamic>> get currentExerciseQuestions {
    var dayData = QuizData.questions[currentDay.value];
    if (dayData != null) {
      var exerciseData = dayData[currentExerciseIndex.value];
      var questions = exerciseData["questions"];
      if (questions != null && questions is List<Map<String, dynamic>>) {
        return questions;
      }
    }
    return [];
  }

  String get currentExercise {
    var dayData = QuizData.questions[currentDay.value];
    if (dayData != null) {
      var exerciseData = dayData[currentExerciseIndex.value];
      var exercise = exerciseData["exercise"];
      if (exercise != null && exercise is String) {
        return exercise;
      }
    }
    return "";
  }

  Map<String, dynamic> get currentQuestion {
    return currentExerciseQuestions.isNotEmpty
        ? currentExerciseQuestions[currentQuestionIndex.value]
        : {};
  }

  void checkAnswer() {
    isAnswerChecked.value = true;
    if (selectedOption.value == currentQuestion["answerIndex"]) {
      correctAnswers.value++;
      Get.snackbar(
        "Correct Answer",
        "Well done! You chose the correct answer.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 55, 110, 57),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "Wrong Answer",
        "The correct answer is: ${currentQuestion["options"][currentQuestion["answerIndex"]]}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 137, 57, 51),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void nextQuestion() {
    if (selectedOption.value == null) {
      Get.snackbar(
        "Please select an answer",
        "You need to choose an answer to proceed.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 137, 57, 51),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    checkAnswer();

    if (selectedOption.value == currentQuestion["answerIndex"]) {
      if (currentQuestionIndex.value < currentExerciseQuestions.length - 1) {
        currentQuestionIndex.value++;
        selectedOption.value = null;
        isAnswerChecked.value = false;
      } else if (currentExerciseIndex.value < QuizData.questions[currentDay.value]!.length - 1) {
        currentExerciseIndex.value++;
        currentQuestionIndex.value = 0;
      } else {
        completeQuiz();
      }
    } 
  }

  void completeQuiz() {
    unlockNextDay();
    Get.snackbar(
      "Exercise Complete",
      "You scored ${correctAnswers.value}!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 55, 110, 57),
      colorText: Colors.white,
    );
    Get.toNamed("/");  // Navigate to home page
  }

  void unlockNextDay() {
    var days = QuizData.questions.keys.toList();
    var currentIndex = days.indexOf(currentDay.value);

    if (currentIndex < days.length - 1) {
      var nextDay = days[currentIndex + 1];
      if (!unlockedDays.contains(nextDay)) {
        unlockedDays.add(nextDay);
      }
    }
  }

  bool isDayUnlocked(String day) {
    return unlockedDays.contains(day);
  }
}
