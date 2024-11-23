import 'package:flutter/material.dart';

class FlowPathScreen extends StatefulWidget {
  @override
  _FlowPathScreenState createState() => _FlowPathScreenState();
}

class _FlowPathScreenState extends State<FlowPathScreen> {
  int selectedDay = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 14, 30),
      appBar: AppBar( backgroundColor: const Color.fromARGB(255, 13, 14, 30),
        title:  const Text(
              'Hey Mahesh',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(20.0),
           
          ),
          // Flow Path Section
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
                  top: 100,
                  left: 50,
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
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.blueGrey,
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
            style: TextStyle(color: Colors.white),
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
    path.moveTo(70, 110); // Starting point
    path.quadraticBezierTo(100, 150, 140, 210); // Control and end points

    // Second curve: Adverbs to Conjunctions
    path.moveTo(140, 210);
    path.quadraticBezierTo(80, 260, 80, 310);

    // Third curve: Conjunctions to Prefix & Suffix
    path.moveTo(80, 310);
    path.quadraticBezierTo(130, 360, 150, 410);

    // Fourth curve: Prefix & Suffix to Sentence structure
    path.moveTo(150, 410);
    path.quadraticBezierTo(60, 460, 60, 510);

    // Fifth curve: Sentence structure to Verbs
    path.moveTo(60, 510);
    path.quadraticBezierTo(120, 560, 120, 610);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}