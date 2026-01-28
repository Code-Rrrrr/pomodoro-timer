import 'package:flutter/material.dart';
import '../models/daily_goal_model.dart';
import '../services/daily_goal_storage.dart';

class DailyGoalProvider extends ChangeNotifier {
  late DailyGoal _dailyGoal;

  DailyGoal get dailyGoal => _dailyGoal;

  DailyGoalProvider() {
    _init();
  }

  Future<void> _init() async {
    final data = await DailyGoalStorage.load();
    final today = DateTime.now();
    final savedDate =
    data['date'] != null ? DateTime.parse(data['date']) : null;

    if (savedDate == null ||
        savedDate.day != today.day ||
        savedDate.month != today.month ||
        savedDate.year != today.year) {
      _dailyGoal = DailyGoal(goal: data['goal'], completed: 0, date: today);
    } else {
      _dailyGoal = DailyGoal(
        goal: data['goal'],
        completed: data['completed'],
        date: savedDate,
      );
    }

    _persist();
    notifyListeners();
  }

  void increment() {
    if (_dailyGoal.completed >= _dailyGoal.goal) return;

    _dailyGoal = DailyGoal(
      goal: _dailyGoal.goal,
      completed: _dailyGoal.completed + 1,
      date: _dailyGoal.date,
    );

    _persist();
    notifyListeners();
  }

  void setGoal(int newGoal) {
    _dailyGoal = DailyGoal(
      goal: newGoal,
      completed: _dailyGoal.completed,
      date: _dailyGoal.date,
    );

    _persist();
    notifyListeners();
  }

  Future<void> _persist() async {
    await DailyGoalStorage.save(
      goal: _dailyGoal.goal,
      completed: _dailyGoal.completed,
      date: _dailyGoal.date.toIso8601String(),
    );
  }
}
