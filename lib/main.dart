import 'package:exerciseapp/components/flow.dart';
import 'package:exerciseapp/controllers/quiz.dart';

import 'package:exerciseapp/pages/quiz.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
    Get.put(QuizController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stimuler',
     debugShowCheckedModeBanner: false,
      home: FlowPathScreen(),
       initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => FlowPathScreen()),
      GetPage(name: '/adjectives', page: () => DailyQuizScreen()),
      GetPage(name: '/adverbs', page: () =>  DailyQuizScreen()),
      GetPage(name: '/conjunctions', page: () =>  DailyQuizScreen()),
      GetPage(name: '/prefix_and_suffix', page: () => DailyQuizScreen()),
      GetPage(name: '/sentence_formation', page: () => DailyQuizScreen()),
      GetPage(name: '/verbs', page: () =>  DailyQuizScreen()),
    ],
    );
   
  }
}

