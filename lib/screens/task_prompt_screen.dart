import 'package:flutter/material.dart';
import '../models/pomodoro_tasks.dart';
import '../widgets/task_input_field.dart';

class TaskPromptScreen extends StatefulWidget {
  const TaskPromptScreen({super.key});

  @override
  State<TaskPromptScreen> createState() => _TaskPromptScreenState();
}

class _TaskPromptScreenState extends State<TaskPromptScreen> {
  final TextEditingController _controller = TextEditingController();

  void _startSession() {
    if (_controller.text.trim().isEmpty) return;

    final task = PomodoroTask(
      title: _controller.text.trim(),
      startTime: DateTime.now(),
    );

    Navigator.pop(context, task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("What are you working on?")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TaskInputField(controller: _controller),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startSession,
              child: const Text("Start Focus Session"),
            )
          ],
        ),
      ),
    );
  }
}

class WorkingWidget extends StatelessWidget{
  WorkingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child:  Text("Hello", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
    );
  }
}