
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
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
                  onTap: () => setState(() => selectedDay = 1),
                ),
                _buildNode(
                  top: 100,
                  left: 30,
                  label: 'Adverbs',
                  isSelected: selectedDay == 2,
                  isCompleted: selectedDay > 2,
                  onTap: () => setState(() => selectedDay = 2),
                ),
                _buildNode(
                  top: 220,
                  left: 40,
                  label: 'Conjunctions',
                  isSelected: selectedDay == 3,
                  isCompleted: selectedDay > 3,
                  onTap: () => setState(() => selectedDay = 3),
                ),
                _buildNode(
                  top: 300,
                  left: 140,
                  label: 'Prefix & Suffix',
                  isSelected: selectedDay == 4,
                  isCompleted: selectedDay > 4,
                  onTap: () => setState(() => selectedDay = 4),
                ),
                _buildNode(
                  top: 430,
                  left: 40,
                  label: 'Sentence structure',
                  isSelected: selectedDay == 5,
                  isCompleted: selectedDay > 5,
                  onTap: () => setState(() => selectedDay = 5),
                ),
                _buildNode(
                  top: 530,
                  left: 100,
                  label: 'Verbs',
                  isSelected: selectedDay == 6,
                  isCompleted: selectedDay > 6,
                  onTap: () => setState(() => selectedDay = 6),
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
                        :  Colors.transparent,
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

    // First curve: Adjectives to Adverbs
    path.moveTo(170, 50);
    path.quadraticBezierTo(20, 100, 50, 130);
    canvas.drawPath(path, selectedDay >= 2 ? glowPaint : paint);

    // Second curve: Adverbs to Conjunctions
    path = Path();
    path.moveTo(50, 130);
    path.quadraticBezierTo(30, 180, 60, 230);
    canvas.drawPath(path, selectedDay >= 3 ? glowPaint : paint);

    // Third curve: Conjunctions to Prefix & Suffix
    path = Path();
    path.moveTo(60, 250);
    path.quadraticBezierTo(100, 280, 170, 330);
    canvas.drawPath(path, selectedDay >= 4 ? glowPaint : paint);

    // Fourth curve: Prefix & Suffix to Sentence structure
    path = Path();
    path.moveTo(170, 340);
    path.quadraticBezierTo(200, 380, 70, 450);
    canvas.drawPath(path, selectedDay >= 5 ? glowPaint : paint);

    // Fifth curve: Sentence structure to Verbs
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





