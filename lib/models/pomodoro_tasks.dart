class PomodoroTask {
  final String title;
  final DateTime startTime;
  bool? completed; // null = not answered yet

  PomodoroTask({
    required this.title,
    required this.startTime,
    this.completed,
  });
}
