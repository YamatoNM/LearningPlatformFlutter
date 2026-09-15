import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const ArtPlaceholder({
    super.key,
    this.width,
    this.height,
    this.radius = 12,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CustomPaint(
          painter: _StripesPainter(color: textColor.withOpacity(0.06)),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _StripesPainter extends CustomPainter {
  final Color color;

  _StripesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const step = 12.0;
    for (double i = -size.height; i < size.width + size.height; i += step) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
