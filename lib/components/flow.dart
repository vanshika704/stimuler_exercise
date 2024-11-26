
// import 'dart:math';
// import 'package:exerciseapp/components/flowpathpainter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:exerciseapp/components/snackbar.dart' as customSnackbar;

// class FlowPathScreen extends StatefulWidget {
//   @override
//   _FlowPathScreenState createState() => _FlowPathScreenState();
// }

// class _FlowPathScreenState extends State<FlowPathScreen> {
//   int selectedDay = 1; // Tracks the current selected day/topic
//   List<Offset> nodePositions = [];
//   final List<String> topics = [
//     "Adjectives",
//     "Adverbs",
//     "Conjunctions",
//     "Prefix and Suffix",
//     "Sentence Formation",
//     "Verbs"
//   ];
//   final Random random = Random();

//   // Initialize the controller using the customSnackbar alias
//   final customSnackbar.SnackbarController snackbarController = Get.put(customSnackbar.SnackbarController());

//   @override
//   void initState() {
//     super.initState();
//     _generateNodePositions();
//   }

//   void _generateNodePositions() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       double screenWidth = MediaQuery.of(context).size.width - 50; // 50px margin on both sides
//       double screenHeight = MediaQuery.of(context).size.height - 120; // 50px margin top and bottom

//       double topMargin = 50; // Fixed top margin
//       double dynamicSpacing = (screenHeight - topMargin) / (topics.length - 1); // Dynamic vertical spacing

//       setState(() {
//         nodePositions = List.generate(topics.length, (index) {
//           double buttonWidth = _getButtonWidth(topics[index]); // Calculate button width dynamically
//           double maxX = screenWidth - buttonWidth - 20; // Ensure button fits within screen

//           // Alternate x positions (left and right)
//           double x = (index % 2 == 0)
//               ? maxX // Position on the right
//               : 50; // Position on the left

//           double y = topMargin + index * dynamicSpacing; // Vertical spacing for nodes
          
//           // Restrict x position to the screen width bounds
//           x = x.clamp(50.0, maxX); // Clamp x-position to screen bounds

//           return Offset(x, y);
//         });
//       });
//     });
//   }

//   double _getButtonWidth(String text) {
//     // Calculate the approximate width of the button based on text length
//     TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: GoogleFonts.quicksand(fontSize: 14),  // Use Quicksand font here
//       ),
//       textDirection: TextDirection.ltr,
//     )..layout();

//     return textPainter.width + 30; // Add padding for the button
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (nodePositions.isEmpty) {
//       return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 11, 12, 19),
//         body: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 11, 12, 19),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(
//           'Hey Mahesh',
//           style: GoogleFonts.quicksand(  // Use Quicksand font for AppBar title
//             color: Colors.white,
//             fontSize: 28,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           CustomPaint(
//             size: Size(double.infinity, double.infinity),
//             painter: FlowPathPainter(
//               selectedDay: selectedDay,
//               nodePositions: nodePositions,
//             ),
//           ),
//           for (int i = 0; i < nodePositions.length; i++)
//             Positioned(
//               top: nodePositions[i].dy - 20, // Center vertically for alignment
//               left: nodePositions[i].dx,
//               child: _buildNode(
//                 label: topics[i],
//                 isSelected: selectedDay == (i + 1),
//                 isCompleted: selectedDay > (i + 1),
//                 onTap: () {
//                   if (i + 1 == selectedDay) {
//                     setState(() {
//                       selectedDay = i + 1;
//                     });
//                     _showCustomModal(topics[i]); // Show modal for the selected day
//                   }
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNode({
//     required String label,
//     required bool isSelected,
//     required bool isCompleted,
//     VoidCallback? onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? const Color.fromARGB(255, 135, 69, 226)
//                       : isCompleted
//                           ? const Color.fromARGB(255, 48, 96, 50)
//                           : const Color.fromARGB(255, 43, 54, 59),
//                   shape: BoxShape.circle,
//                   boxShadow: isSelected
//                       ? [
//                           const BoxShadow(
//                             color: Color.fromARGB(255, 168, 106, 255),
//                             blurRadius: 20,
//                             spreadRadius: 5,
//                           )
//                         ]
//                       : isCompleted
//                           ? [
//                               const BoxShadow(
//                                 color: Colors.greenAccent,
//                                 blurRadius: 10,
//                                 spreadRadius: 3,
//                               )
//                             ]
//                           : [],
//                 ),
//               ),
//               Container(
//                 width: 15,
//                 height: 15,
//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.white,
//                     width: 2,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 10),
//           ElevatedButton(
//             onPressed: onTap,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: isSelected
//                   ? const Color.fromARGB(255, 135, 69, 226)
//                   : isCompleted
//                       ? const Color.fromARGB(255, 48, 96, 50)
//                       : Colors.transparent,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               elevation: 0,
//             ),
//             child: Text(
//               label,
//               style: GoogleFonts.quicksand(  // Use Quicksand font for button text
//                 color: Colors.white,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Custom modal using the customSnackbar logic
//   void _showCustomModal(String topic) {
//     List<Map<String, String>> nodes = [];
    
//     for (int i = 0; i < topics.length; i++) {
//       String state = 'default';
      
//       if (i + 1 == selectedDay) {
//         state = 'selected'; // Mark current topic as 'selected'
//       } else if (i + 1 < selectedDay) {
//         state = 'completed'; // Mark completed topics
//       }

//       // Generate a unique route for each topic (based on index)
//       String route = '/${topics[i].toLowerCase().replaceAll(' ', '_')}';

//       nodes.add({
//         'label': topics[i], 
//         'route': route,  // Use the dynamically generated route
//         'state': state,
//         'icon': 'assets/${topics[i].toLowerCase()}.png',  // Dynamically set icon path
//         'progress': '5/5'  // Adjust progress dynamically if needed
//       });
//     }

//     snackbarController.showModal('Choose Exercise', nodes); // Show the modal with updated nodes
//   }
// }
import 'package:exerciseapp/components/flowpathpainter.dart';
import 'package:exerciseapp/controllers/quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exerciseapp/components/snackbar.dart' as customSnackbar;

class FlowPathScreen extends StatefulWidget {
  @override
  _FlowPathScreenState createState() => _FlowPathScreenState();
}

class _FlowPathScreenState extends State<FlowPathScreen> {
  int selectedDay = 1;
  List<Offset> nodePositions = [];
  final List<String> topics = [
    "Adjectives",
    "Adverbs",
    "Conjunctions",
    "Prefix and Suffix",
    "Sentence Formation",
    "Verbs"
  ];

  bool isQuizCompleted = false;

  @override
  void initState() {
    super.initState();
    _generateNodePositions();
    
    // Listen for changes to unlockedDays from QuizController
    ever(Get.find<QuizController>().unlockedDays, (_) {
      // Check if the next day should be unlocked based on the quiz completion
      if (Get.find<QuizController>().unlockedDays.contains("Day 2") && selectedDay < 2) {
        setState(() {
          selectedDay = 2;
          isQuizCompleted = true; // Mark quiz as completed
        });
      }
    });
  }

  void _generateNodePositions() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenWidth = MediaQuery.of(context).size.width - 50;
      double screenHeight = MediaQuery.of(context).size.height - 120;
      double topMargin = 50;
      double dynamicSpacing = (screenHeight - topMargin) / (topics.length - 1);

      setState(() {
        nodePositions = List.generate(topics.length, (index) {
          double buttonWidth = _getButtonWidth(topics[index]);
          double maxX = screenWidth - buttonWidth - 20;

          double x = (index % 2 == 0) ? maxX : 50;
          double y = topMargin + index * dynamicSpacing;
          x = x.clamp(50.0, maxX);

          return Offset(x, y);
        });
      });
    });
  }

  double _getButtonWidth(String text) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: GoogleFonts.quicksand(fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width + 30;
  }

  @override
  Widget build(BuildContext context) {
    if (nodePositions.isEmpty) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 11, 12, 19),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 12, 19),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Hey Mahesh',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: FlowPathPainter(
              selectedDay: selectedDay,
              nodePositions: nodePositions,
            ),
          ),
          for (int i = 0; i < nodePositions.length; i++)
            Positioned(
              top: nodePositions[i].dy - 20,
              left: nodePositions[i].dx,
              child: _buildNode(
                label: topics[i],
                isSelected: selectedDay == (i + 1),
                isCompleted: selectedDay > (i + 1) || (isQuizCompleted && i == selectedDay),
                onTap: () {
                  if (i + 1 == selectedDay || (isQuizCompleted && i == selectedDay)) {
                    setState(() {
                      selectedDay = i + 1;
                    });
                    _showCustomModal(topics[i]);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNode({
    required String label,
    required bool isSelected,
    required bool isCompleted,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color.fromARGB(255, 135, 69, 226)
                      : isCompleted
                          ? const Color.fromARGB(255, 48, 96, 50)
                          : const Color.fromARGB(255, 43, 54, 59),
                  shape: BoxShape.circle,
                  boxShadow: isSelected
                      ? [
                          const BoxShadow(
                            color: Color.fromARGB(255, 168, 106, 255),
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ]
                      : isCompleted
                          ? [
                              const BoxShadow(
                                color: Colors.greenAccent,
                                blurRadius: 10,
                                spreadRadius: 3,
                              )
                            ]
                          : [],
                ),
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected
                  ? const Color.fromARGB(255, 135, 69, 226)
                  : isCompleted
                      ? const Color.fromARGB(255, 48, 96, 50)
                      : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 0,
            ),
            child: Text(
              label,
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomModal(String topic) {
    List<Map<String, String>> nodes = [];

    for (int i = 0; i < topics.length; i++) {
      String state = 'default';

      if (i + 1 == selectedDay) {
        state = 'selected';
      } else if (i + 1 < selectedDay) {
        state = 'completed';
      }

      String route = '/${topics[i].toLowerCase().replaceAll(' ', '_')}';
String progress = "${QuizController().correctAnswers.value}/5";
      nodes.add({
        'label': topics[i],
        'route': route,
        'state': state,
        'icon': 'assets/${topics[i].toLowerCase()}.png',
        'progress': progress,
      });
    }

    customSnackbar.SnackbarController().showModal('Choose Exercise', nodes);
  }
}
