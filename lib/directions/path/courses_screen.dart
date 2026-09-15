import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/course.dart';
import '../../common/placeholder.dart';

class PathCoursesScreen extends StatelessWidget {
  const PathCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Browse',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: const Color(0xff2b2318),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Fully-round Search Field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xfff4ece0),
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffb3a48e), width: 2),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'What do you want to build?',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffb3a48e),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Three chips
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff2b2318),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                  child: Text(
                    'All',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xfffdf8f1),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                _buildChip('Beginner'),
                const SizedBox(width: 10),
                _buildChip('Projects'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Tall cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: sampleCourses.map((course) {
              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff503c1e).withOpacity(0.07),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ArtPlaceholder(
                      height: 92,
                      radius: 14,
                      label: 'course art',
                      backgroundColor: Color(0xfff0e6d8),
                      textColor: Color(0xffa3927c),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      course.title,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff2b2318),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${course.author} · ${course.hours}',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffa3927c),
                          ),
                        ),
                        Text(
                          course.price,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xfff2542d),
                          ),
                        ),
                      ],
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

  Widget _buildChip(String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff4ece0),
        borderRadius: BorderRadius.circular(99),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      child: Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: const Color(0xff8a7b68),
        ),
      ),
    );
  }
}
