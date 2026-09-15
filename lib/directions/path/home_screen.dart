import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PathHomeScreen extends StatelessWidget {
  const PathHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        // 1. Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Flutter path',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: const Color(0xff2b2318),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffffe9d6),
                borderRadius: BorderRadius.circular(99),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Row(
                children: [
                  Container(
                    width: 9,
                    height: 9,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xfff2542d),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '12',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xffc2400f),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Unit 2 · Building layouts',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: const Color(0xff8a7b68),
          ),
        ),
        const SizedBox(height: 18),

        // 2. Next up Card
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff2b2318),
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NEXT UP · LESSON 9',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffc8b79f),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Row, Column & the magic of Expanded',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xfffdf8f1),
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff2542d),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 13),
                ),
                child: Text(
                  'Continue · 6 min',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),

        // 3. Path timeline map
        Stack(
          children: [
            Positioned(
              left: 26,
              top: 40,
              bottom: 30,
              child: CustomPaint(
                size: const Size(3, double.infinity),
                painter: _DashedLinePainter(color: const Color(0xffe3d6c4)),
              ),
            ),
            Column(
              children: [
                _buildPathNode(
                  iconOrText: '✓',
                  title: 'Hello, Flutter',
                  subtitle: '8 lessons · done',
                  isDone: true,
                ),
                const SizedBox(height: 18),
                _buildPathNode(
                  iconOrText: '9',
                  title: 'Layouts',
                  subtitle: '3 of 11 lessons',
                  isCurrent: true,
                ),
                const SizedBox(height: 18),
                _buildPathNode(
                  iconOrText: '',
                  title: 'State & setState',
                  subtitle: 'locked',
                  isLocked: true,
                ),
                const SizedBox(height: 18),
                _buildPathNode(
                  iconOrText: '',
                  title: 'Navigation',
                  subtitle: 'locked',
                  isLocked: true,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),

        // 4. Two stat tiles
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe6efe4),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '86',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff2f5133),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'widgets learned',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff6d8a6f),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffe9e6f6),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4h 20m',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff3c3169),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'this month',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff7a71a5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPathNode({
    required String iconOrText,
    required String title,
    required String subtitle,
    bool isDone = false,
    bool isCurrent = false,
    bool isLocked = false,
  }) {
    Widget nodeCircle;

    if (isDone) {
      nodeCircle = Container(
        width: 54,
        height: 54,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xff2b2318),
        ),
        child: Center(
          child: Text(
            iconOrText,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: const Color(0xfffdf8f1),
            ),
          ),
        ),
      );
    } else if (isCurrent) {
      nodeCircle = Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xfff2542d),
          border: Border.all(color: const Color(0xffffe0d2), width: 5),
        ),
        child: Center(
          child: Text(
            iconOrText,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      nodeCircle = Container(
        width: 54,
        height: 54,
        child: CustomPaint(
          painter: _DashedCirclePainter(color: const Color(0xffcbb99f)),
        ),
      );
    }

    return Opacity(
      opacity: isLocked ? 0.55 : 1.0,
      child: Row(
        children: [
          nodeCircle,
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2b2318),
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffa3927c),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;

  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const dashHeight = 7.0;
    const dashSpace = 7.0;
    double startY = 0.0;

    while (startY < 260) { // Safe large length matching node constraints
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;

  _DashedCirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffefe5d7)
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    final borderPaint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

    const dashWidth = 4.0;
    const dashSpace = 4.0;
    double distance = 0.0;

    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          borderPaint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
