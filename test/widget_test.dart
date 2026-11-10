import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_platform/main.dart';
import 'package:learning_platform/repositories/course_repository.dart';
import 'package:learning_platform/cubits/course_cubit.dart';

void main() {
  testWidgets('loads the learning platform shell', (tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => CourseCubit(repository: CourseRepository()),
        child: const MyApp(),
      ),
    );
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Courses'), findsOneWidget);
  });
}
