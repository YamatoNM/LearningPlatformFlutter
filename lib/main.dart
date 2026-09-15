import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'directions/faithful/shell.dart';
import 'directions/streak/shell.dart';
import 'directions/path/shell.dart';

void main() {
  runApp(const MyApp());
}

enum AppDirection { faithful, streak, path }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppDirection _direction = AppDirection.faithful;

  // Track independent tab indexes per direction as per implementation plan
  int _faithfulTab = 0;
  int _streakTab = 0;
  int _pathTab = 0;

  @override
  Widget build(BuildContext context) {
    Widget activeShell;
    SystemUiOverlayStyle overlayStyle;

    switch (_direction) {
      case AppDirection.faithful:
        activeShell = FaithfulShell(
          currentIndex: _faithfulTab,
          onTabChanged: (index) => setState(() => _faithfulTab = index),
        );
        overlayStyle = SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: const Color(0xff3a46f0),
          statusBarIconBrightness: Brightness.light,
        );
        break;
      case AppDirection.streak:
        activeShell = StreakShell(
          currentIndex: _streakTab,
          onTabChanged: (index) => setState(() => _streakTab = index),
        );
        overlayStyle = SystemUiOverlayStyle.light.copyWith(
          statusBarColor: const Color(0xff0e1116),
          statusBarIconBrightness: Brightness.light,
        );
        break;
      case AppDirection.path:
        activeShell = PathShell(
          currentIndex: _pathTab,
          onTabChanged: (index) => setState(() => _pathTab = index),
        );
        overlayStyle = SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: const Color(0xfffdf8f1),
          statusBarIconBrightness: Brightness.dark,
        );
        break;
    }

    return MaterialApp(
      title: 'Flutter Learn App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: _direction == AppDirection.streak ? Brightness.dark : Brightness.light,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Scaffold(
          body: Stack(
            children: [
              activeShell,
              // Live debug switcher overlay row at the top of the screen
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 20,
                right: 20,
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSwitcherChip(AppDirection.faithful, '1a Faithful'),
                        _buildSwitcherChip(AppDirection.streak, '1b Streak'),
                        _buildSwitcherChip(AppDirection.path, '1c Path Map'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitcherChip(AppDirection target, String label) {
    final bool isSelected = _direction == target;
    return GestureDetector(
      onTap: () => setState(() => _direction = target),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(99),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.white70,
          ),
        ),
      ),
    );
  }
}
