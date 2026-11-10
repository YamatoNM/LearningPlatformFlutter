class Course {
  final String id;
  final String title;
  final String author;
  final String authorAvatar;
  final String category;
  final double price;
  final double rating;
  final int reviewsCount;
  final int hours;
  final int lessonsCount;
  final String level;
  final String description;
  final bool isFavorite;
  final String badgeColor;
  final List<String> topics;

  const Course({
    required this.id,
    required this.title,
    required this.author,
    required this.authorAvatar,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.hours,
    required this.lessonsCount,
    required this.level,
    required this.description,
    this.isFavorite = false,
    required this.badgeColor,
    required this.topics,
  });

  bool get isFree => price == 0.0;

  String get formattedPrice => isFree ? 'Free' : '\$${price.toStringAsFixed(2)}';

  String get formattedRating => rating.toStringAsFixed(1);

  String get formattedHours => '$hours hrs';

  Course copyWith({
    String? id,
    String? title,
    String? author,
    String? authorAvatar,
    String? category,
    double? price,
    double? rating,
    int? reviewsCount,
    int? hours,
    int? lessonsCount,
    String? level,
    String? description,
    bool? isFavorite,
    String? badgeColor,
    List<String>? topics,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      category: category ?? this.category,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      hours: hours ?? this.hours,
      lessonsCount: lessonsCount ?? this.lessonsCount,
      level: level ?? this.level,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      badgeColor: badgeColor ?? this.badgeColor,
      topics: topics ?? this.topics,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      authorAvatar: json['authorAvatar'] as String? ?? 'CR',
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'] as int? ?? 0,
      hours: json['hours'] as int,
      lessonsCount: json['lessonsCount'] as int? ?? 10,
      level: json['level'] as String? ?? 'Beginner',
      description: json['description'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
      badgeColor: json['badgeColor'] as String? ?? '0xFF3A46F0',
      topics: (json['topics'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'authorAvatar': authorAvatar,
      'category': category,
      'price': price,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'hours': hours,
      'lessonsCount': lessonsCount,
      'level': level,
      'description': description,
      'isFavorite': isFavorite,
      'badgeColor': badgeColor,
      'topics': topics,
    };
  }
}
