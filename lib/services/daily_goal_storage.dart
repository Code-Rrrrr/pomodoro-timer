import 'package:shared_preferences/shared_preferences.dart';

class DailyGoalStorage {
  static const _goalKey = 'daily_goal';
  static const _completedKey = 'daily_completed';
  static const _dateKey = 'daily_date';

  static Future<void> save({
    required int goal,
    required int completed,
    required String date,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_goalKey, goal);
    await prefs.setInt(_completedKey, completed);
    await prefs.setString(_dateKey, date);
  }

  static Future<Map<String, dynamic>> load() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'goal': prefs.getInt(_goalKey) ?? 8,
      'completed': prefs.getInt(_completedKey) ?? 0,
      'date': prefs.getString(_dateKey),
    };
  }

  static Future<void> clearCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_completedKey, 0);
  }
}
