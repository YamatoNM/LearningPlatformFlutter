class LessonModel {
  final String id;
  final String title;
  final String duration;
  final int durationSeconds;
  final bool completed;
  final bool locked;

  const LessonModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.durationSeconds,
    required this.completed,
    required this.locked,
  });

  LessonModel copyWith({
    String? id,
    String? title,
    String? duration,
    int? durationSeconds,
    bool? completed,
    bool? locked,
  }) {
    return LessonModel(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      completed: completed ?? this.completed,
      locked: locked ?? this.locked,
    );
  }

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      durationSeconds: json['durationSeconds'] as int? ?? 0,
      completed: json['completed'] as bool? ?? false,
      locked: json['locked'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'durationSeconds': durationSeconds,
      'completed': completed,
      'locked': locked,
    };
  }
}

class HeroInfo {
  final String label;
  final String imageUrl;
  final int videoCount;
  final int classCount;

  const HeroInfo({
    required this.label,
    required this.imageUrl,
    required this.videoCount,
    required this.classCount,
  });

  factory HeroInfo.fromJson(Map<String, dynamic> json) {
    return HeroInfo(
      label: json['label'] as String? ?? 'COURSE',
      imageUrl: json['imageUrl'] as String? ?? '',
      videoCount: json['videoCount'] as int? ?? 0,
      classCount: json['classCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'imageUrl': imageUrl,
      'videoCount': videoCount,
      'classCount': classCount,
    };
  }
}

class CourseModel {
  final String id;
  final String title;
  final String category;
  final String author;
  final String duration;
  final int durationMinutes;
  final int lessonCount;
  final double rating;
  final double price;
  final bool isFavorite;
  final HeroInfo hero;
  final String description;
  final List<LessonModel> lessons;

  const CourseModel({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.duration,
    required this.durationMinutes,
    required this.lessonCount,
    required this.rating,
    required this.price,
    this.isFavorite = false,
    required this.hero,
    required this.description,
    required this.lessons,
  });

  bool get isFree => price == 0.0;

  String get formattedPrice => isFree ? 'Free' : '\$${price.toStringAsFixed(2)}';

  String get formattedRating => rating.toStringAsFixed(1);

  CourseModel copyWith({
    String? id,
    String? title,
    String? category,
    String? author,
    String? duration,
    int? durationMinutes,
    int? lessonCount,
    double? rating,
    double? price,
    bool? isFavorite,
    HeroInfo? hero,
    String? description,
    List<LessonModel>? lessons,
  }) {
    return CourseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      author: author ?? this.author,
      duration: duration ?? this.duration,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      lessonCount: lessonCount ?? this.lessonCount,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      hero: hero ?? this.hero,
      description: description ?? this.description,
      lessons: lessons ?? this.lessons,
    );
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String? ?? 'General',
      author: json['author'] as String? ?? 'Instructor',
      duration: json['duration'] as String,
      durationMinutes: json['durationMinutes'] as int? ?? 0,
      lessonCount: json['lessonCount'] as int? ?? 0,
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
      hero: json['hero'] != null
          ? HeroInfo.fromJson(json['hero'] as Map<String, dynamic>)
          : const HeroInfo(
              label: 'COURSE',
              imageUrl: '',
              videoCount: 0,
              classCount: 0,
            ),
      description: json['description'] as String? ?? '',
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'author': author,
      'duration': duration,
      'durationMinutes': durationMinutes,
      'lessonCount': lessonCount,
      'rating': rating,
      'price': price,
      'isFavorite': isFavorite,
      'hero': hero.toJson(),
      'description': description,
      'lessons': lessons.map((l) => l.toJson()).toList(),
    };
  }
}
