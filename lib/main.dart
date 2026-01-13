import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/pomodoro/pomodoro_screen.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PomodoroScreen(),
    );
  }
}
