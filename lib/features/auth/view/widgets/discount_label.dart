import 'package:flutter/material.dart';

class DiscountLabel extends StatelessWidget {
  final String discountPercentage;

  const DiscountLabel({Key? key, required this.discountPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DiscountPainter(),
      child: Center(
        child: Text(
          discountPercentage,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class DiscountPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xffFFAB5D);

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 10, 0)
      ..lineTo(size.width, size.height / 38)
      ..lineTo(size.width - 10, size.height)
      ..lineTo(0, size.height)
      ..close();

    final gapPath = Path()
      ..moveTo(size.width - 10, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - 10, 0)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(gapPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}