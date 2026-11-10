import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/course_cubit.dart';
import '../cubits/course_state.dart';
import '../models/course_model.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseId;
  const CourseDetailScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        final course = context.read<CourseCubit>().courseById(courseId);
        if (course == null) return const Scaffold(body: Center(child: Text('Course not found')));
        return Scaffold(
          appBar: AppBar(
            title: const Text('Course details'),
            actions: [IconButton(onPressed: () => context.read<CourseCubit>().toggleFavorite(course.id), icon: Icon(course.isFavorite ? Icons.favorite : Icons.favorite_border))],
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(20), child: SizedBox(height: 210, child: Image.network(course.hero.imageUrl, fit: BoxFit.cover, errorBuilder: (_, _, _) => Container(color: const Color(0xff3a46f0), child: const Icon(Icons.school, color: Colors.white, size: 70))))),
              const SizedBox(height: 20),
              Text(course.category.toUpperCase(), style: const TextStyle(color: Color(0xff3a46f0), fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(course.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('By ${course.author}  •  ${course.duration}  •  ${course.formattedPrice}', style: TextStyle(color: Colors.grey.shade700)),
              const SizedBox(height: 20),
              Text(course.description, style: const TextStyle(fontSize: 16, height: 1.5)),
              const SizedBox(height: 24),
              Text('Lessons (${course.lessons.length})', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...course.lessons.map((lesson) => _LessonTile(course: course, lesson: lesson)),
            ],
          ),
        );
      },
    );
  }
}

class _LessonTile extends StatelessWidget {
  final CourseModel course;
  final LessonModel lesson;
  const _LessonTile({required this.course, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: Icon(lesson.locked ? Icons.lock_outline : lesson.completed ? Icons.check_circle : Icons.play_circle_outline, color: lesson.completed ? Colors.green : const Color(0xff3a46f0)),
        title: Text(lesson.title),
        subtitle: Text(lesson.duration),
        onTap: lesson.locked ? null : () => context.read<CourseCubit>().toggleLessonCompleted(course.id, lesson.id),
      ),
    );
  }
}
