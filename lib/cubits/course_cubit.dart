import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/app_data.dart';
import '../models/course_model.dart';
import '../models/sort_option.dart';
import '../repositories/course_repository.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository repository;
  AppData? _currentAppData;
  String _searchQuery = '';
  String _selectedCategory = 'All';
  SortOption _sortOption = SortOption.ratingDesc;

  CourseCubit({required this.repository}) : super(const CourseInitialState());

  CourseModel? courseById(String id) {
    for (final course in _currentAppData?.courses ?? const <CourseModel>[]) {
      if (course.id == id) return course;
    }
    return null;
  }

  /// Loads application data asynchronously from the JSON file
  Future<void> loadAppData() async {
    emit(const CourseLoadingState());
    try {
      final appData = await repository.loadAppData();
      _currentAppData = appData;
      _applyFilterAndEmit();
    } catch (e) {
      emit(CourseErrorState(
          errorMessage: 'Error loading courses data: ${e.toString()}'));
    }
  }

  /// Triggers a simulated error for testing/demonstrating Error state UI
  void triggerSimulatedError() {
    emit(const CourseErrorState(
      errorMessage:
          'Simulated Network Error: Failed to load course catalog from JSON. Please check connection and try again.',
    ));
  }

  /// Updates the search query string and filters courses
  void updateSearchQuery(String query) {
    _searchQuery = query;
    _applyFilterAndEmit();
  }

  /// Changes the category filter ("All", "Development", "Design", "AI")
  void selectCategory(String category) {
    _selectedCategory = category;
    _applyFilterAndEmit();
  }

  /// Changes the sort option (Title A-Z, Rating, Price, Duration)
  void changeSortOption(SortOption option) {
    _sortOption = option;
    _applyFilterAndEmit();
  }

  /// Resets search query and category filters
  void clearFilters() {
    _searchQuery = '';
    _selectedCategory = 'All';
    _applyFilterAndEmit();
  }

  /// Toggles favorite status for a given course ID
  void toggleFavorite(String courseId) {
    if (_currentAppData == null) return;

    final updatedCourses = _currentAppData!.courses.map((course) {
      if (course.id == courseId) {
        return course.copyWith(isFavorite: !course.isFavorite);
      }
      return course;
    }).toList();

    _currentAppData = _currentAppData!.copyWith(courses: updatedCourses);
    _applyFilterAndEmit();
  }

  /// Toggles completion status for a lesson inside a course
  void toggleLessonCompleted(String courseId, String lessonId) {
    if (_currentAppData == null) return;

    final updatedCourses = _currentAppData!.courses.map((course) {
      if (course.id == courseId) {
        final updatedLessons = course.lessons.map((lesson) {
          if (lesson.id == lessonId && !lesson.locked) {
            return lesson.copyWith(completed: !lesson.completed);
          }
          return lesson;
        }).toList();

        return course.copyWith(lessons: updatedLessons);
      }
      return course;
    }).toList();

    _currentAppData = _currentAppData!.copyWith(courses: updatedCourses);
    _applyFilterAndEmit();
  }

  /// Private helper method to filter, sort, and emit appropriate State (Success or Empty)
  void _applyFilterAndEmit() {
    if (_currentAppData == null) return;

    List<CourseModel> result = List.from(_currentAppData!.courses);

    // 1. Filter by category
    if (_selectedCategory != 'All') {
      result = result
          .where((c) =>
              c.category.toLowerCase() == _selectedCategory.toLowerCase())
          .toList();
    }

    // 2. Filter by search query
    if (_searchQuery.trim().isNotEmpty) {
      final query = _searchQuery.trim().toLowerCase();
      result = result.where((c) {
        return c.title.toLowerCase().contains(query) ||
            c.author.toLowerCase().contains(query) ||
            c.category.toLowerCase().contains(query) ||
            c.description.toLowerCase().contains(query);
      }).toList();
    }

    // 3. Sort results
    switch (_sortOption) {
      case SortOption.titleAsc:
        result.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case SortOption.ratingDesc:
        result.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case SortOption.priceAsc:
        result.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.durationDesc:
        result.sort((a, b) => b.durationMinutes.compareTo(a.durationMinutes));
        break;
    }

    // 4. Emit Empty or Success state
    if (result.isEmpty) {
      emit(CourseEmptyState(
        appData: _currentAppData!,
        searchQuery: _searchQuery,
        selectedCategory: _selectedCategory,
        message: 'No courses found for "$_searchQuery" in category "$_selectedCategory".',
      ));
    } else {
      emit(CourseSuccessState(
        appData: _currentAppData!,
        filteredCourses: result,
        searchQuery: _searchQuery,
        selectedCategory: _selectedCategory,
        sortOption: _sortOption,
      ));
    }
  }
}
