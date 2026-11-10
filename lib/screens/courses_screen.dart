import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/course_cubit.dart';
import '../cubits/course_state.dart';
import '../models/sort_option.dart';
import '../models/course_model.dart';
import '../widgets/category_chip_list.dart';
import '../widgets/course_card.dart';
import '../widgets/empty_view.dart';
import '../widgets/error_view.dart';
import '../widgets/loading_view.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        if (state is CourseLoadingState || state is CourseInitialState) return const LoadingView();
        if (state is CourseErrorState) {
          return ErrorView(errorMessage: state.errorMessage, onRetry: context.read<CourseCubit>().loadAppData);
        }
        final cubit = context.read<CourseCubit>();
        final isEmpty = state is CourseEmptyState;
        final success = state is CourseSuccessState ? state : null;
        final empty = state is CourseEmptyState ? state : null;
        final courses = success?.filteredCourses ?? const <CourseModel>[];
        final categories = success?.availableCategories ?? empty!.availableCategories;
        final selected = success?.selectedCategory ?? empty!.selectedCategory;
        final sort = success?.sortOption ?? SortOption.ratingDesc;
        final favoritesOnly = success?.favoritesOnly ?? empty!.favoritesOnly;
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            children: [
              const Text('Explore courses', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                onChanged: cubit.updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Search by title, author or topic',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                      cubit.clearFilters();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  filled: true, fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 14),
              CategoryChipList(categories: categories, selectedCategory: selected, onSelected: cubit.selectCategory),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: FilterChip(
                  selected: favoritesOnly,
                  avatar: Icon(
                    favoritesOnly ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: favoritesOnly ? Colors.white : const Color(0xff3a46f0),
                  ),
                  label: const Text('Favorites only'),
                  showCheckmark: false,
                  selectedColor: const Color(0xff3a46f0),
                  labelStyle: TextStyle(color: favoritesOnly ? Colors.white : Colors.black87),
                  onSelected: (_) => cubit.toggleFavoritesOnly(),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: DropdownButton<SortOption>(
                  value: sort,
                  underline: const SizedBox(),
                  onChanged: (value) { if (value != null) cubit.changeSortOption(value); },
                  items: SortOption.values.map((option) => DropdownMenuItem(value: option, child: Text(option.label))).toList(),
                ),
              ),
              if (isEmpty)
                const SizedBox(height: 300, child: EmptyView())
              else
                ...courses.map((course) => CourseCard(course: course, onFavoriteToggle: () => cubit.toggleFavorite(course.id))),
            ],
          ),
        );
      },
    );
  }
}
