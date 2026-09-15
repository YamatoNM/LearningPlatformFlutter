import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/course.dart';

class StreakCoursesScreen extends StatelessWidget {
  const StreakCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Courses',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Dark Search Field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff161c25),
              border: Border.all(color: const Color(0xff232a38)),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            child: Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xff606b7e), width: 2),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'search widgets, dart, async…',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff606b7e),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Four filter pills
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterPill('All', true),
                const SizedBox(width: 9),
                _buildFilterPill('Popular', false),
                const SizedBox(width: 9),
                _buildFilterPill('New', false),
                const SizedBox(width: 9),
                _buildFilterPill('Free', false),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Course list cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: sampleCourses.map((course) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: const Color(0xff141922),
                  border: Border.all(color: const Color(0xff232a38)),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            course.title,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          course.price,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xffc9f24a),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${course.author} · ${course.hours}',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff6f7a90),
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Three-segment rule at the bottom
                    Row(
                      children: List.generate(3, (index) => Expanded(
                        child: Container(
                          height: 4,
                          margin: EdgeInsets.only(right: index < 2 ? 6 : 0),
                          decoration: BoxDecoration(
                            color: const Color(0xff232a38),
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterPill(String label, bool isActive) {
    if (isActive) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xffc9f24a),
          borderRadius: BorderRadius.circular(99),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: const Color(0xff10151d),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff232a38)),
          borderRadius: BorderRadius.circular(99),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: const Color(0xff8b95a8),
          ),
        ),
      );
    }
  }
}
