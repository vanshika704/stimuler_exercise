// import 'package:flutter/material.dart';

// class FlowPathPainter extends CustomPainter {
//   final int selectedDay;
//   final List<Offset> nodePositions;

//   FlowPathPainter({required this.selectedDay, required this.nodePositions});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint pathPaint = Paint()
//       ..color = const Color.fromARGB(255, 31, 31, 31)
//       ..strokeWidth = 8
//       ..style = PaintingStyle.stroke;

//     Paint glowPathPaint = Paint()
//       ..color = const Color.fromARGB(255, 48, 96, 50)
//       ..strokeWidth = 10
//       ..style = PaintingStyle.stroke
//       ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10);

//     Path path = Path();

//     for (int i = 0; i < nodePositions.length - 1; i++) {
//       Offset start = nodePositions[i];
//       Offset end = nodePositions[i + 1];
//       path.moveTo(start.dx, start.dy);
//       path.lineTo(end.dx, end.dy);
//     }

//     canvas.drawPath(path, glowPathPaint);
//     canvas.drawPath(path, pathPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
import 'package:flutter/material.dart';

class FlowPathPainter extends CustomPainter {
  final int selectedDay;
  final List<Offset> nodePositions;

  FlowPathPainter({required this.selectedDay, required this.nodePositions});

  @override
  void paint(Canvas canvas, Size size) {
    Paint pathPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 31, 31)
      ..strokeWidth = 8 // Reduced thickness of the path
      ..style = PaintingStyle.stroke;

    Paint glowPathPaint = Paint()
      ..color = const Color.fromARGB(255, 48, 96, 50)
      ..strokeWidth = 10 // Glow thickness adjusted
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10);

    Path path = Path();

    for (int i = 0; i < nodePositions.length - 1; i++) {
      Offset start = nodePositions[i];
      Offset end = nodePositions[i + 1];
      Offset control1 = Offset((start.dx + end.dx) / 2, start.dy + 30);
      Offset control2 = Offset((start.dx + end.dx) / 2, end.dy - 30);

      path.moveTo(start.dx, start.dy);
      path.cubicTo(
        control1.dx,
        control1.dy,
        control2.dx,
        control2.dy,
        end.dx,
        end.dy,
      );
    }

    canvas.drawPath(path, pathPaint);

    if (selectedDay > 1) {
      canvas.drawPath(path, glowPathPaint); // Apply glowing path
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
} 