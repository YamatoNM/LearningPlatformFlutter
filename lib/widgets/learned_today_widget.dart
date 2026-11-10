import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/app_data.dart';

class LearnedTodayWidget extends StatelessWidget {
  final LearnedTodayData data;

  const LearnedTodayWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffeeeef4)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1e1e50).withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff7a7e8c),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Learning goals are managed in your profile settings.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  'My courses',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff3a46f0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${data.learnedMinutes}min',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xff16161a),
                ),
              ),
              Text(
                ' / ${data.goalMinutes}min',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffa4a8ba),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: data.progress,
              minHeight: 10,
              backgroundColor: const Color(0xffeef2ff),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff3a46f0)),
            ),
          ),
        ],
      ),
    );
  }
}
