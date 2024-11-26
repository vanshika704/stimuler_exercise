# Exercise App

This Flutter-based exercise app is designed to help users learn grammar through interactive quizzes. Each day consists of a different exercise with progressively unlocked content. The app tracks progress, rewards the user with points for correct answers, and unlocks further exercises based on quiz performance.

# Features
Day-wise exercises: Users are given daily exercises that cover grammar topics like adjectives, adverbs, conjunctions, sentence formation, etc.
Interactive quiz: Each exercise consists of multiple questions where users can choose answers. The app tracks correct answers and shows feedback.
Progress tracking: Completed quizzes unlock the next day’s exercise.
Dynamic user interface: Nodes representing topics change color based on completion status, with animations indicating progress.
Custom modal for exercise selection: After completing a quiz, a custom modal appears to show the user's score and progress.
# Technologies Used
Flutter: The app is built using the Flutter framework.
GetX: State management library for reactive UI and easy navigation.
Google Fonts: To enhance the UI with custom fonts.
Custom Painting: For visual flow of exercise paths with interactive nodes.
Snackbars: For real-time feedback on quiz results.

# App Flow
Main Screen: Displays an interactive flow path of exercises (nodes), each representing a topic.
Day-wise Exercise: Each node represents a day's topic, and users can interact with these to take quizzes.
Quiz Screen: A series of multiple-choice questions where users answer questions related to the topic.
Quiz Completion: Upon completing a quiz, users receive feedback and a score. The next day's exercise is unlocked.
Unlocking Mechanism: When a quiz is completed, the next day becomes available for selection, and a green node signifies a completed day.

# Installation
To get started with the Exercise App, clone this repository and run the following commands in your terminal:

Clone the repository:

bash

git clone https://github.com/yourusername/exerciseapp.git
cd exerciseapp
Install dependencies:

bash

flutter pub get
Run the app:

bash
Copy code
flutter run
Make sure you have Flutter and Dart SDK installed on your machine. You can follow the installation guide on Flutter's official website.

How It Works
App Initialization: When the app starts, the user is presented with an introductory screen and a flow path of exercises.
Navigation & State Management: The app uses GetX for state management to track quiz progress and manage which day (exercise) the user is on.
Quiz Progression: The user’s answers are checked, and upon completing a quiz, feedback is shown, and the next day's exercise is unlocked.
Visual Pathway: Each day's progress is shown visually on a flow chart where nodes change colors to indicate the current, completed, or locked states of exercises.
Quiz Structure
Each quiz is defined in the QuizData file, which contains questions for each day. Each exercise consists of:

A set of multiple-choice questions.
Feedback when answers are selected.
A score is awarded for correct answers, which is tracked and displayed.
Data Format:
dart

List<Map<String, dynamic>> questions = {
  "Day 1": [
    {
      "exercise": "Adjectives Quiz",
      "questions": [
        {
          "question": "What is an adjective?",
          "options": ["Word describing a noun", "A noun", "Verb"],
          "answerIndex": 0
        },
        // Additional questions
      ],
    },
  ],
  // More days data...
};
# State Management with GetX
We use GetX for:

# Reactive State Management:
 Automatically updates the UI when data changes (e.g., unlocking new days).
Controller: Manages the app's logic, including quiz flow, day unlocking, and question tracking.
Snackbars: Provides instant feedback on quiz progress.
# App Structure
lib
controllers/quiz.dart: The QuizController manages the quiz logic, state, and unlocking mechanism.
components/flowpathpainter.dart: Custom painter for the flow path UI that visualizes the progress.
components/quizdata.dart: Contains the questions and exercise data.
pages/flowpathscreen.dart: Main screen displaying the flow path of exercises.
components/snackbar.dart: Custom snackbar to show progress feedback.
# Contributions
If you want to contribute to this project, feel free to fork the repository and create a pull request. Contributions are welcome!

# Future Improvements
Leaderboard: Add a feature for tracking high scores across users.
More Topics: Expand the range of grammar topics available for exercises.
Voice Interaction: Add voice-based interactions for better accessibility.



