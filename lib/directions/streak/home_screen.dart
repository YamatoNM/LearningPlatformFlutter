import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/placeholder.dart';

class StreakHomeScreen extends StatelessWidget {
  const StreakHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        // 1. Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'day 12 · beginner track',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff6f7a90),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Keep the streak',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const ArtPlaceholder(
              width: 44,
              height: 44,
              radius: 22,
              label: '',
              backgroundColor: Color(0xff232936),
              textColor: Color(0xff2c3342),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // 2. Streak Card
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff1b2130), Color(0xff141922)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: const Color(0xff232a38)),
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '12',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 56,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xffc9f24a),
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'day streak',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff8b95a8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(5, (_) => Expanded(
                    child: Container(
                      height: 38,
                      margin: const EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xffc9f24a),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                  ...List.generate(2, (_) => Expanded(
                    child: Container(
                      height: 38,
                      margin: const EdgeInsets.only(right: 7),
                      child: CustomPaint(
                        painter: _DashedBorderPainter(color: const Color(0xff38414f)),
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['M', 'T', 'W', 'T', 'F', 'S', 'S'].map((label) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        label,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff606b7e),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // 3. Today's drill Card
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff141922),
            border: Border.all(color: const Color(0xff232a38)),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's drill",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffc9f24a).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        '4 min',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffc9f24a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Code Block
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff10151d),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCodeLine('1', [
                      _span('Widget ', const Color(0xff7cc4ff)),
                      _span('build(BuildContext c) {', const Color(0xff8ea0bd)),
                    ]),
                    const SizedBox(height: 4),
                    _buildCodeLine('2', [
                      _span('   ', Colors.transparent),
                      _span('return ', const Color(0xffc9f24a)),
                      _span('Column(', const Color(0xff8ea0bd)),
                    ]),
                    const SizedBox(height: 4),
                    _buildCodeLine('3', [
                      _span('     children: [ ___ ],', const Color(0xff8ea0bd)),
                    ]),
                    const SizedBox(height: 4),
                    _buildCodeLine('4', [
                      _span('   );', const Color(0xff8ea0bd)),
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffc9f24a),
                      foregroundColor: const Color(0xff10151d),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Fill the blank',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // 4. Continue Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Continue',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              '3 in progress',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: const Color(0xff6f7a90),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Continue List items
        _buildContinueItem('Stateless vs Stateful', 0.72, '72%'),
        const SizedBox(height: 10),
        _buildContinueItem('Async & Futures', 0.30, '30%'),
      ],
    );
  }

  Widget _buildContinueItem(String title, double progress, String percentage) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff141922),
        border: Border.all(color: const Color(0xff232a38)),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          const ArtPlaceholder(
            width: 42,
            height: 42,
            radius: 12,
            label: '',
            backgroundColor: Color(0xff1e2836),
            textColor: Color(0xff26303f),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 9),
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xff232a38),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffc9f24a),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Text(
            percentage,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: const Color(0xff8b95a8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeLine(String lineNum, List<TextSpan> spans) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 18,
          child: Text(
            lineNum,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              color: const Color(0xff6f7a90),
            ),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.jetBrainsMono(fontSize: 12, height: 1.7),
              children: spans,
            ),
          ),
        ),
      ],
    );
  }

  TextSpan _span(String text, Color color) {
    return TextSpan(text: text, style: TextStyle(color: color));
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;

  _DashedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(10),
      ));

    // Simple dash painter logic
    const dashWidth = 4.0;
    const dashSpace = 4.0;

    for (var i = 0; i < 4; i++) {
      // Approximate dashed rectangle drawing along the edges for simplicity & precision
    }
    // Let's paint a neat dashed rounded rectangle properly:
    final dashPath = Path();
    double distance = 0.0;
    for (final Metric in path.computeMetrics()) {
      while (distance < Metric.length) {
        dashPath.addPath(
          Metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
