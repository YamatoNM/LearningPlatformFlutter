import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/course.dart';
import '../../common/placeholder.dart';

class FaithfulCoursesScreen extends StatelessWidget {
  const FaithfulCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        // Title row + avatar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Courses',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xff16161a),
                ),
              ),
              const ArtPlaceholder(
                width: 44,
                height: 44,
                radius: 22,
                label: '',
                backgroundColor: Color(0xffdfe3ff),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Search field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xfff2f2f8),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffa4a8ba), width: 2),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Find a course',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffa4a8ba),
                    ),
                  ),
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xff3a46f0), width: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Two 96px category tiles
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xffd8ecff),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Dart',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff1b4a75),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xfff6e2f5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Animations',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff7a2f72),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),

        // Choose your course heading
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Choose your course',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: const Color(0xff16161a),
            ),
          ),
        ),
        const SizedBox(height: 14),

        // Segmented pills
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff3a46f0),
                  borderRadius: BorderRadius.circular(99),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Text(
                  'All',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  'Popular',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff8d91a5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  'New',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff8d91a5),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Course list rows
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: sampleCourses.map((course) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xffeeeef4)),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1e1e50).withOpacity(0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const ArtPlaceholder(
                      width: 72,
                      height: 72,
                      radius: 12,
                      label: 'cover',
                      backgroundColor: Color(0xffe6e6ee),
                      textColor: Color(0xff9a9db0),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff16161a),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            course.author,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffa4a8ba),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                course.price,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xff3a46f0),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffeee8),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Text(
                                  course.hours,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xfff2542d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
}
