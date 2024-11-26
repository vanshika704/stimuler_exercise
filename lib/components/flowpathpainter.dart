// import 'dart:ui';

// import 'package:flutter/widgets.dart';

// class FlowPathPainter extends CustomPainter {
//   final int selectedDay;
//   final List<Offset> nodePositions;

//   FlowPathPainter({required this.selectedDay, required this.nodePositions});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint pathPaint = Paint()
//       ..color = const Color.fromARGB(255, 21, 26, 43)
//       ..strokeWidth = 8 // Reduced thickness of the path
//       ..style = PaintingStyle.stroke;

//     Paint glowPathPaint = Paint()
//       ..color = const Color.fromARGB(255, 48, 96, 50)
//       ..strokeWidth = 10 // Glow thickness adjusted
//       ..style = PaintingStyle.stroke
//       ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10);

//     Path path = Path();

//     for (int i = 0; i < nodePositions.length - 1; i++) {
//       Offset start = nodePositions[i];
//       Offset end = nodePositions[i + 1];
//       Offset control1 = Offset((start.dx + end.dx) / 2, start.dy + 30);
//       Offset control2 = Offset((start.dx + end.dx) / 2, end.dy - 30);

//       path.moveTo(start.dx, start.dy);
//       path.cubicTo(
//         control1.dx,
//         control1.dy,
//         control2.dx,
//         control2.dy,
//         end.dx,
//         end.dy,
//       );
//     }

//     canvas.drawPath(path, pathPaint);

//     // Glow effect for completed days
//     if (selectedDay > 1) {
//       Path glowPath = Path();
//       for (int i = 0; i < nodePositions.length - 1; i++) {
//         if (i + 1 < selectedDay) {
//           Offset start = nodePositions[i];
//           Offset end = nodePositions[i + 1];
//           Offset control1 = Offset((start.dx + end.dx) / 2, start.dy + 30);
//           Offset control2 = Offset((start.dx + end.dx) / 2, end.dy - 30);

//           glowPath.moveTo(start.dx, start.dy);
//           glowPath.cubicTo(
//             control1.dx,
//             control1.dy,
//             control2.dx,
//             control2.dy,
//             end.dx,
//             end.dy,
//           );
//         }
//       }
//       canvas.drawPath(glowPath, glowPathPaint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }


import 'dart:ui';
import 'package:flutter/widgets.dart';

class FlowPathPainter extends CustomPainter {
  final int selectedDay;  // Selected day by the user
  final List<Offset> nodePositions;  // Positions of the nodes

  FlowPathPainter({required this.selectedDay, required this.nodePositions});

  @override
  void paint(Canvas canvas, Size size) {
    Paint pathPaint = Paint()
      ..color = const Color.fromARGB(255, 21, 26, 43)
      ..strokeWidth = 8  // Path thickness
      ..style = PaintingStyle.stroke;

    Paint glowPathPaint = Paint()
      ..color = const Color.fromARGB(255, 48, 96, 50)  // Green glow for completed nodes
      ..strokeWidth = 10  // Glow thickness
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10);

    Path path = Path();

    // Draw all paths between the nodes
    for (int i = 0; i < nodePositions.length - 1; i++) {
      Offset start = nodePositions[i];
      Offset end = nodePositions[i + 1];
      Offset control1 = Offset((start.dx + end.dx) / 2, start.dy + 30);
      Offset control2 = Offset((start.dx + end.dx) / 2, end.dy - 30);

      path.moveTo(start.dx, start.dy);
      path.cubicTo(control1.dx, control1.dy, control2.dx, control2.dy, end.dx, end.dy);
    }

    // Draw default path
    canvas.drawPath(path, pathPaint);

    // Draw glowing path for completed nodes
    Path glowPath = Path();
    for (int i = 0; i < nodePositions.length - 1; i++) {
      if (i + 1 < selectedDay) {  // Completed paths
        Offset start = nodePositions[i];
        Offset end = nodePositions[i + 1];
        Offset control1 = Offset((start.dx + end.dx) / 2, start.dy + 30);
        Offset control2 = Offset((start.dx + end.dx) / 2, end.dy - 30);

        glowPath.moveTo(start.dx, start.dy);
        glowPath.cubicTo(control1.dx, control1.dy, control2.dx, control2.dy, end.dx, end.dy);
      }
    }
    canvas.drawPath(glowPath, glowPathPaint);

    // Highlight the path for the selected day (in green)
    if (selectedDay > 1) {
      Path selectedPath = Path();
      for (int i = 0; i < nodePositions.length - 1; i++) {
        if (i + 1 == selectedDay) {  // Path for the selected day
          Offset start = nodePositions[i];
          Offset end = nodePositions[i + 1];
          Offset control1 = Offset((start.dx + end.dx) / 2, start.dy + 30);
          Offset control2 = Offset((start.dx + end.dx) / 2, end.dy - 30);

          selectedPath.moveTo(start.dx, start.dy);
          selectedPath.cubicTo(control1.dx, control1.dy, control2.dx, control2.dy, end.dx, end.dy);
        }
      }
      Paint selectedPathPaint = Paint()
        ..color = const Color.fromARGB(255, 135, 69, 226)  // Selected path color
        ..strokeWidth = 8
        ..style = PaintingStyle.stroke;
      canvas.drawPath(selectedPath, selectedPathPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
