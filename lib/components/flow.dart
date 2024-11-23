import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'snackbar.dart' as customSnackbar; // Alias custom SnackbarController

class FlowPathScreen extends StatefulWidget {
  @override
  _FlowPathScreenState createState() => _FlowPathScreenState();
}

class _FlowPathScreenState extends State<FlowPathScreen> {
//   int selectedDay = 1;
//   final customSnackbar.SnackbarController snackbarController = Get.put(customSnackbar.SnackbarController());  // Use custom SnackbarController

//   // Define the nodes with labels and their respective routes
//   List<Map<String, String>> nodes = [
//   {
//     'label': 'Adjectives', 
//     'route': '/adjectives', 
//     'state': 'completed',
//     'icon': 'assets/adjectives.png',  // URL or path to the icon
//     'progress': '75%'  // Or any progress description you want to show
//   },
//   {
//     'label': 'Adverbs', 
//     'route': '/adverbs', 
//     'state': 'selected',
//     'icon': 'assets/adverbs.jpg',
//     'progress': '40%'
//   },
//   {
//     'label': 'Conjunctions', 
//     'route': '/conjunctions', 
//     'state': 'default',
//     'icon': 'assets/conjunction.jpeg',
//     'progress': '10%'
//   },
//   {
//     'label': 'Prefix & Suffix', 
//     'route': '/prefix_suffix', 
//     'state': 'default',
//     'icon': 'assets/Prefix-and-Suffix-Activity-Ideas-Cover-and-Facebook.png',
//     'progress': '50%'
//   },
//   {
//     'label': 'Sentence structure', 
//     'route': '/sentence_structure', 
//     'state': 'default',
//     'icon': 'assets/Sentence-structure.webp',
//     'progress': '30%'
//   },
//   {
//     'label': 'Verbs', 
//     'route': '/verbs', 
//     'state': 'default',
//     'icon': 'assets/verbs_ver_1.png',
//     'progress': '60%'
//   },
// ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 11, 12, 19),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(
//           'Hey Mahesh',
//           style: GoogleFonts.quicksand(
//             color: Colors.white,
//             fontSize: 28,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 // Custom Paint for the curves
//                 CustomPaint(
//                   size: Size(double.infinity, double.infinity),
//                   painter: FlowPathPainter(selectedDay: selectedDay),
//                 ),
//                 // Positioned nodes
//                 _buildNode(
//                   top: 10,
//                   left: 150,
//                   label: 'Adjectives',
//                   isSelected: selectedDay == 1,
//                   isCompleted: selectedDay > 1,
//                   onTap: () {
//                     setState(() => selectedDay = 1);
//                     snackbarController.showModal('Adjectives!', nodes); // Show nodes in snackbar
//                   },
//                 ),
//                 _buildNode(
//                   top: 100,
//                   left: 30,
//                   label: 'Adverbs',
//                   isSelected: selectedDay == 2,
//                   isCompleted: selectedDay > 2,
//                   onTap: () {
//                     setState(() => selectedDay = 2);
//                     snackbarController.showModal('Adverbs!', nodes); // Show nodes in snackbar
//                   },
//                 ),
//                 _buildNode(
//                   top: 220,
//                   left: 40,
//                   label: 'Conjunctions',
//                   isSelected: selectedDay == 3,
//                   isCompleted: selectedDay > 3,
//                   onTap: () {
//                     setState(() => selectedDay = 3);
//                     snackbarController.showModal('Conjunctions!', nodes); // Show nodes in snackbar
//                   },
//                 ),
//                 _buildNode(
//                   top: 300,
//                   left: 140,
//                   label: 'Prefix & Suffix',
//                   isSelected: selectedDay == 4,
//                   isCompleted: selectedDay > 4,
//                   onTap: () {
//                     setState(() => selectedDay = 4);
//                     snackbarController.showModal('Prefix & Suffix!', nodes); // Show nodes in snackbar
//                   },
//                 ),
//                 _buildNode(
//                   top: 430,
//                   left: 40,
//                   label: 'Sentence structure',
//                   isSelected: selectedDay == 5,
//                   isCompleted: selectedDay > 5,
//                   onTap: () {
//                     setState(() => selectedDay = 5);
//                     snackbarController.showModal('Sentence Structure!', nodes); // Show nodes in snackbar
//                   },
//                 ),
//                 _buildNode(
//                   top: 530,
//                   left: 100,
//                   label: 'Verbs',
//                   isSelected: selectedDay == 6,
//                   isCompleted: selectedDay > 6,
//                   onTap: () {
//                     setState(() => selectedDay = 6);
//                     snackbarController.showModal('Verbs!', nodes); // Show nodes in snackbar
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNode({
//     required double top,
//     required double left,
//     required String label,
//     required bool isSelected,
//     required bool isCompleted,
//     VoidCallback? onTap,
//   }) {
//     return Positioned(
//       top: top,
//       left: left,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Row(
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: isSelected
//                         ? const Color.fromARGB(255, 135, 69, 226)
//                         : isCompleted
//                             ? const Color.fromARGB(255, 48, 96, 50)
//                             : const Color.fromARGB(255, 43, 54, 59),
//                     shape: BoxShape.circle,
//                     boxShadow: isSelected
//                         ? [
//                             const BoxShadow(
//                               color: Color.fromARGB(255, 168, 106, 255),
//                               blurRadius: 20,
//                               spreadRadius: 5,
//                             )
//                           ]
//                         : isCompleted
//                             ? [
//                                 const BoxShadow(
//                                   color: Colors.greenAccent,
//                                   blurRadius: 10,
//                                   spreadRadius: 3,
//                                 )
//                               ]
//                             : [],
//                   ),
//                 ),
//                 Container(
//                   width: 15,
//                   height: 15,
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 10),
//             ElevatedButton(
//               onPressed: onTap,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: isSelected
//                     ? const Color.fromARGB(255, 135, 69, 226)
//                     : isCompleted
//                         ? const Color.fromARGB(255, 48, 96, 50)
//                         : Colors.transparent,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 elevation: 0,
//               ),
//               child: Text(
//                 label,
//                 style: GoogleFonts.quicksand(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



  int selectedDay = 1;
  final customSnackbar.SnackbarController snackbarController = Get.put(customSnackbar.SnackbarController());

  // Define the nodes with labels and their respective routes
  List<Map<String, String>> nodes = [
    {
      'label': 'Adjectives', 
      'route': '/adjectives', 
      'state': 'completed',
      'icon': 'assets/adjectives.png',  // URL or path to the icon
      'progress': '75%'  // Or any progress description you want to show
    },
    {
      'label': 'Adverbs', 
      'route': '/adverbs', 
      'state': 'selected',
      'icon': 'assets/adverbs.jpg',
      'progress': '40%'
    },
    {
      'label': 'Conjunctions', 
      'route': '/conjunctions', 
      'state': 'default',
      'icon': 'assets/conjunction.jpeg',
      'progress': '10%'
    },
    {
      'label': 'Prefix & Suffix', 
      'route': '/prefix_suffix', 
      'state': 'default',
      'icon': 'assets/Prefix-and-Suffix-Activity-Ideas-Cover-and-Facebook.png',
      'progress': '50%'
    },
    {
      'label': 'Sentence structure', 
      'route': '/sentence_structure', 
      'state': 'default',
      'icon': 'assets/Sentence-structure.webp',
      'progress': '30%'
    },
    {
      'label': 'Verbs', 
      'route': '/verbs', 
      'state': 'default',
      'icon': 'assets/verbs_ver_1.png',
      'progress': '60%'
    },
  ];

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Custom Paint for the curves
                CustomPaint(
                  size: Size(double.infinity, double.infinity),
                  painter: FlowPathPainter(selectedDay: selectedDay),
                ),
                // Positioned nodes
                _buildNode(
                  top: 10,
                  left: 150,
                  label: 'Adjectives',
                  isSelected: selectedDay == 1,
                  isCompleted: selectedDay > 1,
                  onTap: () {
                    setState(() {
                      selectedDay = 1;
                      nodes[0]['state'] = 'selected'; // Update node state dynamically
                      for (int i = 1; i < nodes.length; i++) {
                        nodes[i]['state'] = 'default'; // Reset other nodes
                      }
                    });
                    snackbarController.showModal('Adjectives!', nodes); // Show nodes in snackbar
                  },
                ),
                _buildNode(
                  top: 100,
                  left: 30,
                  label: 'Adverbs',
                  isSelected: selectedDay == 2,
                  isCompleted: selectedDay > 2,
                  onTap: () {
                    setState(() {
                      selectedDay = 2;
                      nodes[1]['state'] = 'selected'; // Update node state dynamically
                      for (int i = 0; i < nodes.length; i++) {
                        if (i != 1) nodes[i]['state'] = 'default'; // Reset other nodes
                      }
                    });
                    snackbarController.showModal('Adverbs!', nodes); // Show nodes in snackbar
                  },
                ),
                _buildNode(
                  top: 220,
                  left: 40,
                  label: 'Conjunctions',
                  isSelected: selectedDay == 3,
                  isCompleted: selectedDay > 3,
                  onTap: () {
                    setState(() {
                      selectedDay = 3;
                      nodes[2]['state'] = 'selected'; // Update node state dynamically
                      for (int i = 0; i < nodes.length; i++) {
                        if (i != 2) nodes[i]['state'] = 'default'; // Reset other nodes
                      }
                    });
                    snackbarController.showModal('Conjunctions!', nodes); // Show nodes in snackbar
                  },
                ),
                _buildNode(
                  top: 300,
                  left: 140,
                  label: 'Prefix & Suffix',
                  isSelected: selectedDay == 4,
                  isCompleted: selectedDay > 4,
                  onTap: () {
                    setState(() {
                      selectedDay = 4;
                      nodes[3]['state'] = 'selected'; // Update node state dynamically
                      for (int i = 0; i < nodes.length; i++) {
                        if (i != 3) nodes[i]['state'] = 'default'; // Reset other nodes
                      }
                    });
                    snackbarController.showModal('Prefix & Suffix!', nodes); // Show nodes in snackbar
                  },
                ),
                _buildNode(
                  top: 430,
                  left: 40,
                  label: 'Sentence structure',
                  isSelected: selectedDay == 5,
                  isCompleted: selectedDay > 5,
                  onTap: () {
                    setState(() {
                      selectedDay = 5;
                      nodes[4]['state'] = 'selected'; // Update node state dynamically
                      for (int i = 0; i < nodes.length; i++) {
                        if (i != 4) nodes[i]['state'] = 'default'; // Reset other nodes
                      }
                    });
                    snackbarController.showModal('Sentence Structure!', nodes); // Show nodes in snackbar
                  },
                ),
                _buildNode(
                  top: 530,
                  left: 100,
                  label: 'Verbs',
                  isSelected: selectedDay == 6,
                  isCompleted: selectedDay > 6,
                  onTap: () {
                    setState(() {
                      selectedDay = 6;
                      nodes[5]['state'] = 'selected'; // Update node state dynamically
                      for (int i = 0; i < nodes.length; i++) {
                        if (i != 5) nodes[i]['state'] = 'default'; // Reset other nodes
                      }
                    });
                    snackbarController.showModal('Verbs!', nodes); // Show nodes in snackbar
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNode({
    required double top,
    required double left,
    required String label,
    required bool isSelected,
    required bool isCompleted,
    VoidCallback? onTap,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
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


class FlowPathPainter extends CustomPainter {
  final int selectedDay;

  FlowPathPainter({required this.selectedDay});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 31, 31, 31)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Paint glowPaint = Paint()
      ..color = const Color.fromARGB(255, 48, 96, 50)
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10);

    Path path = Path();

    // Draw paths based on selected day to highlight them
    path.moveTo(170, 50);
    path.quadraticBezierTo(20, 100, 50, 130);
    canvas.drawPath(path, selectedDay >= 2 ? glowPaint : paint);

    path = Path();
    path.moveTo(50, 130);
    path.quadraticBezierTo(30, 180, 60, 230);
    canvas.drawPath(path, selectedDay >= 3 ? glowPaint : paint);

    path = Path();
    path.moveTo(60, 250);
    path.quadraticBezierTo(100, 280, 170, 330);
    canvas.drawPath(path, selectedDay >= 4 ? glowPaint : paint);

    path = Path();
    path.moveTo(170, 340);
    path.quadraticBezierTo(200, 380, 70, 450);
    canvas.drawPath(path, selectedDay >= 5 ? glowPaint : paint);

    path = Path();
    path.moveTo(60, 470);
    path.quadraticBezierTo(100, 500, 120, 570);
    canvas.drawPath(path, selectedDay >= 6 ? glowPaint : paint);

    path.moveTo(190, 770); // Center of "Sentence structure" node
    path.quadraticBezierTo(100, 500, 120, 570); // Control point and center of "Verbs"
    canvas.drawPath(path, selectedDay >= 6 ? glowPaint : paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
