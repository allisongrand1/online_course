import 'package:flutter/material.dart';

class Sun extends CustomPainter {
  final double opacity;
  Sun({required this.opacity});
  @override
  void paint(Canvas canvas, Size size) {
    final painterSun = Paint()
      ..color = const Color.fromARGB(255, 239, 235, 112)
          .withOpacity(_getSunOpacity(opacity))
      ..style = PaintingStyle.fill;

    final pathSun = Path()
      ..addOval(Rect.fromCircle(center: const Offset(0, 0), radius: 15));
    canvas.drawPath(pathSun, painterSun);

    final painterCloud = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
          .withOpacity(_getCloudOpacity(opacity))
      ..style = PaintingStyle.fill;

    final painterCloudWithRain = Paint()
      ..color = const Color.fromARGB(255, 139, 139, 139)
          .withOpacity(_getRainOpacity(opacity))
      ..style = PaintingStyle.fill;

    final pathCloud = Path()
      ..moveTo(-25, 0)
      ..cubicTo(-20, -20, 0, -5, 5, 0)
      ..moveTo(0, 0)
      ..cubicTo(3, -11, 25, -5, 25, 0)
      ..moveTo(25, 0)
      ..cubicTo(25, 13, -25, 13, -25, 0);
    canvas.drawPath(pathCloud, painterCloud);

    canvas.drawPath(pathCloud, painterCloudWithRain);

    final pathRain = Path()
      ..moveTo(0, 12)
      ..lineTo(5, 17)
      ..cubicTo(5, 25, 0, 25, -2, 17)
      ..lineTo(0, 12)
      ..moveTo(15, 12)
      ..lineTo(20, 17)
      ..cubicTo(20, 25, 15, 25, 13, 17)
      ..lineTo(15, 12)
      ..moveTo(-15, 12)
      ..lineTo(-10, 17)
      ..cubicTo(-10, 25, -15, 25, -18, 17)
      ..lineTo(-15, 12);

    canvas.drawPath(pathRain, painterCloudWithRain);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  double _getRainOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }
    return 10 / 3 * value - 7 / 3;
  }

  double _getCloudOpacity(double value) {
    if (0 <= value && value < 0.2) {
      return 0;
    } else if (0.2 <= value && value <= 0.5) {
      return 10 / 4 * value - 1 / 4;
    } else if (0.5 < value && value < 0.8) {
      return -(10 / 3) * value + 8 / 3;
    }
    return 0;
  }

  double _getSunOpacity(double value) {
    if (0.0 <= value && value <= 0.2) {
      return -(10 / 3) * value + 1;
    }
    return 0;
  }
}

/* class Cloud extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painterCloud = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill;

    final pathCloud = Path()
      ..moveTo(-25, 0)
      ..cubicTo(-20, -20, 0, -5, 5, 0)
      ..moveTo(0, 0)
      ..cubicTo(3, -11, 25, -5, 25, 0)
      ..moveTo(25, 0)
      ..cubicTo(25, 13, -25, 13, -25, 0);
    canvas.drawPath(pathCloud, painterCloud);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CloudWithRain extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painterCloudWithRain = Paint()
      ..color = Color.fromARGB(255, 139, 139, 139)
      ..style = PaintingStyle.fill;

    final pathCloud = Path()
      ..moveTo(-25, 0)
      ..cubicTo(-20, -20, 0, -5, 5, 0)
      ..moveTo(0, 0)
      ..cubicTo(3, -11, 25, -5, 25, 0)
      ..moveTo(25, 0)
      ..cubicTo(25, 13, -25, 13, -25, 0);

    canvas.drawPath(pathCloud, painterCloudWithRain);

    final pathRain = Path()
      ..moveTo(0, 12)
      ..lineTo(5, 17)
      ..cubicTo(5, 25, 0, 25, -2, 17)
      ..lineTo(0, 12)
      ..moveTo(15, 12)
      ..lineTo(20, 17)
      ..cubicTo(20, 25, 15, 25, 13, 17)
      ..lineTo(15, 12)
      ..moveTo(-15, 12)
      ..lineTo(-10, 17)
      ..cubicTo(-10, 25, -15, 25, -18, 17)
      ..lineTo(-15, 12);

    canvas.drawPath(pathRain, painterCloudWithRain);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
 */