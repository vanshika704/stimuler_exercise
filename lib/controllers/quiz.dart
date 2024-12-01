// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:exerciseapp/components/quizdata.dart';

// class QuizController extends GetxController {
//   var currentDay = "Day 1".obs;
//   var currentExerciseIndex = 0.obs;
//   var currentQuestionIndex = 0.obs;
//   var correctAnswers = 0.obs;
//   var selectedOption = Rxn<int>();
//   var isAnswerChecked = false.obs;
//   var unlockedDays = ["Day 1"].obs; // Using Rx for reactivity

//   List<Map<String, dynamic>> get currentExerciseQuestions {
//     var dayData = QuizData.questions[currentDay.value];
//     if (dayData != null) {
//       var exerciseData = dayData[currentExerciseIndex.value];
//       var questions = exerciseData["questions"];
//       if (questions != null && questions is List<Map<String, dynamic>>) {
//         return questions;
//       }
//     }
//     return [];
//   }

//   String get currentExercise {
//     var dayData = QuizData.questions[currentDay.value];
//     if (dayData != null) {
//       var exerciseData = dayData[currentExerciseIndex.value];
//       var exercise = exerciseData["exercise"];
//       if (exercise != null && exercise is String) {
//         return exercise;
//       }
//     }
//     return "";
//   }

//   Map<String, dynamic> get currentQuestion {
//     return currentExerciseQuestions.isNotEmpty
//         ? currentExerciseQuestions[currentQuestionIndex.value]
//         : {};
//   }

//   void checkAnswer() {
//     isAnswerChecked.value = true;
//     if (selectedOption.value == currentQuestion["answerIndex"]) {
//       correctAnswers.value++;
//       Get.snackbar(
//         "Correct Answer",
//         "Well done! You chose the correct answer.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color.fromARGB(255, 55, 110, 57),
//         colorText: Colors.white,
//         duration: const Duration(seconds: 2),
//       );
//     } else {
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

//   void nextQuestion() {
//     if (selectedOption.value == null) {
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

//     checkAnswer();

//     if (selectedOption.value == currentQuestion["answerIndex"]) {
//       if (currentQuestionIndex.value < currentExerciseQuestions.length - 1) {
//         currentQuestionIndex.value++;
//         selectedOption.value = null;
//         isAnswerChecked.value = false;
//       } else if (currentExerciseIndex.value < QuizData.questions[currentDay.value]!.length - 1) {
//         currentExerciseIndex.value++;
//         currentQuestionIndex.value = 0;
//       } else {
//         completeQuiz();
//       }
//     } 
//   }

//   void completeQuiz() {
//     unlockNextDay();
//     Get.snackbar(
//       "Exercise Complete",
//       "You scored ${correctAnswers.value}!",
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: const Color.fromARGB(255, 55, 110, 57),
//       colorText: Colors.white,
//     );
//     Get.toNamed("/");  // Navigate to home page
//   }

//   void unlockNextDay() {
//     var days = QuizData.questions.keys.toList();
//     var currentIndex = days.indexOf(currentDay.value);

//     if (currentIndex < days.length - 1) {
//       var nextDay = days[currentIndex + 1];
//       if (!unlockedDays.contains(nextDay)) {
//         unlockedDays.add(nextDay);  // This triggers reactivity
//       }
//     }
//   }

//   bool isDayUnlocked(String day) {
//     return unlockedDays.contains(day);  // Returns true if the day is unlocked
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:exerciseapp/components/quizdata.dart';  // Ensure this file contains quiz data for "Adverbs", "Conjunctions", etc.

class QuizController extends GetxController {
  var currentDay = "Day 1".obs; // Set based on selected quiz type from SnackbarController
  var currentExerciseIndex = 0.obs;
  var currentQuestionIndex = 0.obs;
  var correctAnswers = 0.obs;
  var selectedOption = Rxn<int>();
  var isAnswerChecked = false.obs;
  var unlockedDays = ["Day 1"].obs;

  // Fetch questions based on the currentDay value
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
        unlockedDays.add(nextDay);  // This triggers reactivity
      }
    }
  }

  bool isDayUnlocked(String day) {
    return unlockedDays.contains(day);  // Returns true if the day is unlocked
  }
}
