import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/placeholder.dart';

class FaithfulHomeScreen extends StatelessWidget {
  const FaithfulHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // 1. Blue Header Block
        Container(
          color: const Color(0xff3a46f0),
          padding: const EdgeInsets.fromLTRB(22, 24, 22, 74),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Kristin',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Let's build something today",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.78),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const ArtPlaceholder(
                width: 48,
                height: 48,
                radius: 24,
                label: '',
                backgroundColor: Color(0xff8e96ff),
                textColor: Colors.white,
              ),
            ],
          ),
        ),

        // 2. Practiced Today Card (overlapping)
        Transform.translate(
          offset: const Offset(0, -48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff1e1e50).withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Practiced today',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff7a7f94),
                        ),
                      ),
                      Text(
                        'My courses',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff3a46f0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '18min',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff16161a),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '/ 30min',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffa4a8ba),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xffeeeef6),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: constraints.maxWidth * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              gradient: const LinearGradient(
                                colors: [Color(0xffff9b54), Color(0xfff2542d)],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // 3. Horizontal Cards
        Transform.translate(
          offset: const Offset(0, -32),
          child: SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // Hero card 1
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffdfe7ff),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 140,
                            child: Text(
                              'Your first widget in 10 minutes',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff16214d),
                                height: 1.35,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff2542d),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: -6,
                        bottom: -18,
                        child: const ArtPlaceholder(
                          width: 104,
                          height: 110,
                          radius: 12,
                          label: 'illustration',
                          backgroundColor: Color(0xffc3d1ff),
                          textColor: Color(0xff4a5580),
                        ),
                      ),
                    ],
                  ),
                ),
                // Hero card 2
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xffdff0e6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xff7fb894), width: 2),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Daily quiz',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff1d4230),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // 4. Learning Plan List Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Learning Plan',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xff16161a),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1e1e50).withOpacity(0.06),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                child: Column(
                  children: [
                    _buildPlanRow('Flutter Widgets', 40, 48, 0.83, true),
                    _buildPlanRow('Dart Basics', 6, 24, 0.25, true),
                    _buildPlanRow('State Management', 2, 26, 0.08, false),
                  ],
                ),
              ),
            ],
          ),
        ),

        // 5. Meetup Card
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 22, 16, 32),
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xffece4fb),
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.all(18),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meetup',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff5b2ea8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 170,
                      child: Text(
                        'Off-line Flutter jams in your city',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff7a5aa8),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: const ArtPlaceholder(
                    width: 92,
                    height: 62,
                    radius: 12,
                    label: 'illustration',
                    backgroundColor: Color(0xffd9c9f5),
                    textColor: Color(0xff6b4a9e),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlanRow(String title, int current, int total, double progress, bool hasDivider) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: hasDivider
            ? const Border(bottom: BorderSide(color: Color(0xfff0f0f6)))
            : null,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 26,
            height: 26,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 3,
              backgroundColor: const Color(0xffe9e9f3),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff3a46f0)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: const Color(0xff16161a),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: const Color(0xff16161a),
              ),
              children: [
                TextSpan(text: '$current'),
                TextSpan(
                  text: '/$total',
                  style: const TextStyle(color: Color(0xffb6b9c9)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
