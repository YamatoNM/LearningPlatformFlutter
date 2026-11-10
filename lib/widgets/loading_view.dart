import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingView extends StatelessWidget {
  final String message;

  const LoadingView({
    super.key,
    this.message = 'Loading courses from JSON asset...',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff3a46f0).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff3a46f0)),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Async JSON Data Loading',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color(0xff16161a),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xff7a7e8c),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
