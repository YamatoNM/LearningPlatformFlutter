import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChipList extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategoryChipList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: categories.map((cat) {
          final isSelected = cat.toLowerCase() == selectedCategory.toLowerCase();
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: FilterChip(
              selected: isSelected,
              showCheckmark: false,
              label: Text(
                cat,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xff606470),
                ),
              ),
              backgroundColor: const Color(0xfff5f6fa),
              selectedColor: const Color(0xff3a46f0),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              onSelected: (_) => onSelected(cat),
            ),
          );
        }).toList(),
      ),
    );
  }
}
