import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/course_cubit.dart';
import '../cubits/course_state.dart';
import '../widgets/course_card.dart';
import '../widgets/empty_view.dart';
import '../widgets/error_view.dart';
import '../widgets/loading_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        if (state is CourseLoadingState || state is CourseInitialState) {
          return const LoadingView();
        }
        if (state is CourseErrorState) {
          return ErrorView(
            errorMessage: state.errorMessage,
            onRetry: context.read<CourseCubit>().loadAppData,
          );
        }
        final data = state is CourseSuccessState
            ? state.appData
            : (state as CourseEmptyState).appData;
        final popular = [...data.courses]..sort((a, b) => b.rating.compareTo(a.rating));
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
            children: [
              Row(
                children: [
                  Expanded(child: Text(data.header.greeting, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800))),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: data.header.avatarUrl.isEmpty ? null : NetworkImage(data.header.avatarUrl),
                    child: data.header.avatarUrl.isEmpty ? const Icon(Icons.person) : null,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(data.header.subtitle, style: TextStyle(color: Colors.grey.shade600)),
              const SizedBox(height: 24),
              Card(
                elevation: 0,
                color: const Color(0xff3a46f0),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(data.learnedToday.title, style: const TextStyle(color: Colors.white70)),
                    const SizedBox(height: 8),
                    Text(data.learnedToday.formatted, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(value: data.learnedToday.progress, minHeight: 8, color: Colors.orangeAccent, backgroundColor: Colors.white24),
                  ]),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Popular courses', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              if (popular.isEmpty)
                const SizedBox(height: 250, child: EmptyView())
              else
                ...popular.take(3).map((course) => CourseCard(
                      course: course,
                      onFavoriteToggle: () => context.read<CourseCubit>().toggleFavorite(course.id),
                    )),
            ],
          ),
        );
      },
    );
  }
}
