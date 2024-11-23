import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlowPathScreen(),
    );
  }
}

class FlowPathScreen extends StatefulWidget {
  @override
  _FlowPathScreenState createState() => _FlowPathScreenState();
}

class _FlowPathScreenState extends State<FlowPathScreen> {
  int selectedDay = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 12, 19),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Hey Mahesh',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
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
                  painter: FlowPathPainter(),
                ),
                // Positioned nodes
                _buildNode(
                  top: 10,
                  left: 200,
                  label: 'Adjectives',
                  isSelected: selectedDay == 1,
                  onTap: () => setState(() => selectedDay = 1),
                ),
                _buildNode(
                  top: 200,
                  left: 120,
                  label: 'Adverbs',
                  isSelected: selectedDay == 2,
                  onTap: () => setState(() => selectedDay = 2),
                ),
                _buildNode(
                  top: 300,
                  left: 70,
                  label: 'Conjunctions',
                  isSelected: false,
                ),
                _buildNode(
                  top: 400,
                  left: 120,
                  label: 'Prefix & Suffix',
                  isSelected: false,
                ),
                _buildNode(
                  top: 500,
                  left: 50,
                  label: 'Sentence structure',
                  isSelected: false,
                ),
                _buildNode(
                  top: 600,
                  left: 100,
                  label: 'Verbs',
                  isSelected: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build nodes
  Widget _buildNode({
    required double top,
    required double left,
    required String label,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 48, 96, 50)
                : const Color.fromARGB(255, 43, 54, 59),
            borderRadius: BorderRadius.circular(20),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.greenAccent,
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ]
                : [],
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Custom Painter for the curved paths
class FlowPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    // First curve: Adjectives to Adverbs
    path.moveTo(220, 20); // Start point of "Adjectives"
    path.quadraticBezierTo(200, 120, 150, 200); // Control point and end point for "Adverbs"

    // Second curve: Adverbs to Conjunctions
    path.moveTo(150, 200); // Start point of "Adverbs"
    path.quadraticBezierTo(100, 260, 90, 300); // Control point and end point for "Conjunctions"

    // Third curve: Conjunctions to Prefix & Suffix
    path.moveTo(90, 300); // Start point of "Conjunctions"
    path.quadraticBezierTo(130, 360, 150, 400); // Control point and end point for "Prefix & Suffix"

    // Fourth curve: Prefix & Suffix to Sentence structure
    path.moveTo(150, 400); // Start point of "Prefix & Suffix"
    path.quadraticBezierTo(50, 460, 60, 500); // Control point and end point for "Sentence structure"

    // Fifth curve: Sentence structure to Verbs
    path.moveTo(60, 500); // Start point of "Sentence structure"
    path.quadraticBezierTo(100, 570, 120, 600); // Control point and end point for "Verbs"

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
