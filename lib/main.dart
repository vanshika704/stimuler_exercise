import 'package:exerciseapp/components/flow.dart';
import 'package:exerciseapp/pages/AdjectivesPage.dart';
import 'package:exerciseapp/pages/Adverbs.dart';
import 'package:exerciseapp/pages/Conjunctions.dart';
import 'package:exerciseapp/pages/Prefix.dart';
import 'package:exerciseapp/pages/Sentence.dart';
import 'package:exerciseapp/pages/verbs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
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
      GetPage(name: '/adjectives', page: () => AdjectivesScreen()),
      GetPage(name: '/adverbs', page: () => GrammarPracticeScreen()),
      GetPage(name: '/conjunctions', page: () => ConjunctionsScreen()),
      GetPage(name: '/prefix_and_suffix', page: () => PrefixSuffixScreen()),
      GetPage(name: '/sentence formation', page: () => SentenceStructureQuizScreen()),
      GetPage(name: '/verbs', page: () => VerbsQuizScreen()),
    ],
    );
   
  }
}

