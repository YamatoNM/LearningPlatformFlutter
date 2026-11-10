import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/course_cubit.dart';
import 'repositories/course_repository.dart';
import 'screens/home_screen.dart';
import 'screens/courses_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CourseCubit(repository: CourseRepository())..loadAppData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learnly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff3a46f0)),
        scaffoldBackgroundColor: const Color(0xfff7f7fb),
        fontFamily: 'Arial',
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [HomeScreen(), CoursesScreen()],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) => setState(() => _currentIndex = index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.school_outlined), selectedIcon: Icon(Icons.school), label: 'Courses'),
          ],
        ),
      ),
    );
  }
}
