import 'course_model.dart';

class HeaderData {
  final String greeting;
  final String subtitle;
  final String avatarUrl;
  final bool hasUnreadNotification;

  const HeaderData({
    required this.greeting,
    required this.subtitle,
    required this.avatarUrl,
    required this.hasUnreadNotification,
  });

  factory HeaderData.fromJson(Map<String, dynamic> json) {
    return HeaderData(
      greeting: json['greeting'] as String? ?? 'Hi, Student',
      subtitle: json['subtitle'] as String? ?? 'Let’s start learning',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      hasUnreadNotification:
          json['notification']?['hasUnread'] as bool? ?? false,
    );
  }
}

class LearnedTodayData {
  final String title;
  final int learnedMinutes;
  final int goalMinutes;
  final String formatted;
  final double progress;

  const LearnedTodayData({
    required this.title,
    required this.learnedMinutes,
    required this.goalMinutes,
    required this.formatted,
    required this.progress,
  });

  factory LearnedTodayData.fromJson(Map<String, dynamic> json) {
    return LearnedTodayData(
      title: json['title'] as String? ?? 'Learned today',
      learnedMinutes: json['learnedMinutes'] as int? ?? 0,
      goalMinutes: json['goalMinutes'] as int? ?? 60,
      formatted: json['formatted'] as String? ?? '0min / 60min',
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class LearningPlanItem {
  final String id;
  final String title;
  final int completed;
  final int total;
  final double progress;

  const LearningPlanItem({
    required this.id,
    required this.title,
    required this.completed,
    required this.total,
    required this.progress,
  });

  factory LearningPlanItem.fromJson(Map<String, dynamic> json) {
    return LearningPlanItem(
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as int? ?? 0,
      total: json['total'] as int? ?? 1,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class MeetupData {
  final String title;
  final String subtitle;
  final String imageUrl;

  const MeetupData({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  factory MeetupData.fromJson(Map<String, dynamic> json) {
    return MeetupData(
      title: json['title'] as String? ?? 'Meetup',
      subtitle: json['subtitle'] as String? ?? 'Off-line exchange of learning experience',
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }
}

class AppData {
  final HeaderData header;
  final LearnedTodayData learnedToday;
  final List<LearningPlanItem> learningPlanItems;
  final MeetupData meetup;
  final List<CourseModel> courses;

  const AppData({
    required this.header,
    required this.learnedToday,
    required this.learningPlanItems,
    required this.meetup,
    required this.courses,
  });

  factory AppData.fromJson(Map<String, dynamic> json) {
    final home = json['homePage'] as Map<String, dynamic>? ?? {};
    final coursesList = (json['courses'] as List<dynamic>?)
            ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    final planItems = (home['learningPlan']?['items'] as List<dynamic>?)
            ?.map((e) => LearningPlanItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return AppData(
      header: HeaderData.fromJson(
        home['header'] as Map<String, dynamic>? ?? {},
      ),
      learnedToday: LearnedTodayData.fromJson(
        home['learnedToday'] as Map<String, dynamic>? ?? {},
      ),
      learningPlanItems: planItems,
      meetup: MeetupData.fromJson(
        home['meetup'] as Map<String, dynamic>? ?? {},
      ),
      courses: coursesList,
    );
  }

  AppData copyWith({
    HeaderData? header,
    LearnedTodayData? learnedToday,
    List<LearningPlanItem>? learningPlanItems,
    MeetupData? meetup,
    List<CourseModel>? courses,
  }) {
    return AppData(
      header: header ?? this.header,
      learnedToday: learnedToday ?? this.learnedToday,
      learningPlanItems: learningPlanItems ?? this.learningPlanItems,
      meetup: meetup ?? this.meetup,
      courses: courses ?? this.courses,
    );
  }
}
