import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'courses_screen.dart';

class StreakShell extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  const StreakShell({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e1116),
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: currentIndex,
          children: const [
            StreakHomeScreen(),
            StreakCoursesScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff0e1116),
          border: Border(top: BorderSide(color: Color(0xff1d232e))),
        ),
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabItem(0, 'Home', const Color(0xffc9f24a), const Color(0xff4e5768), true),
            _buildTabItem(1, 'Courses', const Color(0xffc9f24a), const Color(0xff4e5768), false),
            _buildTabItem(2, 'Streak', const Color(0xffc9f24a), const Color(0xff4e5768), false, isCircle: true),
            _buildTabItem(3, 'You', const Color(0xffc9f24a), const Color(0xff4e5768), false, isCustomShape: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(
    int index,
    String label,
    Color activeColor,
    Color inactiveColor,
    bool roundedSquare, {
    bool isCircle = false,
    bool isCustomShape = false,
  }) {
    final bool isActive = currentIndex == index;
    final Color color = isActive ? activeColor : inactiveColor;

    return GestureDetector(
      onTap: () {
        if (index < 2) {
          onTabChanged(index);
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 2),
                borderRadius: isCircle
                    ? BorderRadius.circular(9)
                    : isCustomShape
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          )
                        : BorderRadius.circular(roundedSquare ? 6 : 3),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
