import 'package:flutter/material.dart';
import 'package:pomodoro_timer/screens/task_prompt_screen.dart';

import 'models/pomodoro_tasks.dart';

PomodoroTask? currentTask;

void startPomodoro(BuildContext context) async {
  currentTask = await Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TaskPromptScreen()),
  );

  if (currentTask == null) return;

  // 👉 START YOUR TIMER HERE

  Future<void> showCompletionDialog(
      BuildContext context, PomodoroTask task) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Session Complete"),
        content: const Text("Be honest. Did you work on this task?"),
        actions: [
          TextButton(
            onPressed: () {
              task.completed = false;
              Navigator.pop(context);
            },
            child: const Text("No 😬"),
          ),
          ElevatedButton(
            onPressed: () {
              task.completed = true;
              Navigator.pop(context);
            },
            child: const Text("Yes ✅"),
          ),
        ],
      ),
    );
  }

  if (currentTask != null) {
    await showCompletionDialog(context, currentTask!);
  }

}
