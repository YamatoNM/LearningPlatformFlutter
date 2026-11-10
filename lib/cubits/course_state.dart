import '../models/app_data.dart';
import '../models/course_model.dart';
import '../models/sort_option.dart';

abstract class CourseState {
  const CourseState();
}

class CourseInitialState extends CourseState {
  const CourseInitialState();
}

class CourseLoadingState extends CourseState {
  const CourseLoadingState();
}

class CourseSuccessState extends CourseState {
  final AppData appData;
  final List<CourseModel> filteredCourses;
  final String searchQuery;
  final String selectedCategory;
  final SortOption sortOption;

  const CourseSuccessState({
    required this.appData,
    required this.filteredCourses,
    required this.searchQuery,
    required this.selectedCategory,
    required this.sortOption,
  });

  int get favoritesCount =>
      appData.courses.where((c) => c.isFavorite).length;

  List<String> get availableCategories {
    final set = <String>{'All'};
    for (var c in appData.courses) {
      if (c.category.isNotEmpty) set.add(c.category);
    }
    return set.toList();
  }

  CourseSuccessState copyWith({
    AppData? appData,
    List<CourseModel>? filteredCourses,
    String? searchQuery,
    String? selectedCategory,
    SortOption? sortOption,
  }) {
    return CourseSuccessState(
      appData: appData ?? this.appData,
      filteredCourses: filteredCourses ?? this.filteredCourses,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      sortOption: sortOption ?? this.sortOption,
    );
  }
}

class CourseEmptyState extends CourseState {
  final AppData appData;
  final String searchQuery;
  final String selectedCategory;
  final String message;

  const CourseEmptyState({
    required this.appData,
    required this.searchQuery,
    required this.selectedCategory,
    this.message = 'No courses match your search or filter criteria.',
  });

  List<String> get availableCategories {
    final set = <String>{'All'};
    for (var c in appData.courses) {
      if (c.category.isNotEmpty) set.add(c.category);
    }
    return set.toList();
  }
}

class CourseErrorState extends CourseState {
  final String errorMessage;

  const CourseErrorState({required this.errorMessage});
}
