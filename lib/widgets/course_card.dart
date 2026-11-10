import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/course_model.dart';
import '../screens/course_detail_screen.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onFavoriteToggle;

  const CourseCard({
    super.key,
    required this.course,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => CourseDetailScreen(courseId: course.id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffeeeef4)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff1e1e50).withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail Hero Container
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 90,
                height: 90,
                color: const Color(0xff3a46f0).withValues(alpha: 0.1),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (course.hero.imageUrl.isNotEmpty)
                      Image.network(
                        course.hero.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildFallbackImage(),
                      )
                    else
                      _buildFallbackImage(),
                    Container(
                      color: Colors.black.withValues(alpha: 0.15),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.85),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Color(0xff3a46f0),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 14),
            // Course Details Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Category Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xffeef2ff),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          course.category.toUpperCase(),
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xff3a46f0),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      // Favorite Toggle Button
                      GestureDetector(
                        onTap: onFavoriteToggle,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            course.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: course.isFavorite
                                ? const Color(0xfff2542d)
                                : const Color(0xffa4a8ba),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Title
                  Text(
                    course.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff16161a),
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Author & Duration
                  Text(
                    '${course.author} • ${course.duration}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff7a7e8c),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Price and Rating Row
                  Row(
                    children: [
                      Text(
                        course.formattedPrice,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: course.isFree
                              ? const Color(0xff00c853)
                              : const Color(0xff3a46f0),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xffffb300),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        course.formattedRating,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff16161a),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      color: const Color(0xff3a46f0),
      alignment: Alignment.center,
      child: const Icon(
        Icons.school_rounded,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
