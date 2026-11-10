import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_data.dart';

class LearningPlanCard extends StatelessWidget {
  final LearningPlanItem item;

  const LearningPlanCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final percentage = (item.progress * 100).toInt();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffeeeef4)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1e1e50).withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Circular Progress indicator
          SizedBox(
            width: 44,
            height: 44,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: item.progress,
                  strokeWidth: 4,
                  backgroundColor: const Color(0xffeef2ff),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff3a46f0)),
                ),
                Center(
                  child: Text(
                    '$percentage%',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff3a46f0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff16161a),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.completed} of ${item.total} lessons completed',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff7a7e8c),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xffa4a8ba),
            size: 22,
          ),
        ],
      ),
    );
  }
}
