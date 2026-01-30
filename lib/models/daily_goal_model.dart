class DailyGoal {
  final int goal;
  final int completed;
  final DateTime date;

  DailyGoal({
    required this.goal,
    required this.completed,
    required this.date,
  });

  double get progress =>
      goal == 0 ? 0 : (completed / goal).clamp(0.0, 1.0);
}
