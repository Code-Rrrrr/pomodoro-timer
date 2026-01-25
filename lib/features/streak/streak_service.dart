import 'package:shared_preferences/shared_preferences.dart';

import 'streak_model.dart';

class StreakService {
  static const _key = 'focus_streak';

  Future<StreakModel> getStreak() async {
    final prefs = await SharedPreferences.getInstance();

    return StreakModel(
      currentStreak: prefs.getInt('currentStreak') ?? 0,
      bestStreak: prefs.getInt('bestStreak') ?? 0,
      lastCompletedDate: prefs.getString('lastCompletedDate') != null
          ? DateTime.parse(prefs.getString('lastCompletedDate')!)
          : null,
    );
  }

  Future<void> onPomodoroCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final lastDateStr = prefs.getString('lastCompletedDate');
    final lastDate = lastDateStr != null
        ? DateTime.parse(lastDateStr)
        : null;

    int currentStreak = prefs.getInt('currentStreak') ?? 0;
    int bestStreak = prefs.getInt('bestStreak') ?? 0;

    if (lastDate == null) {
      currentStreak = 1;
    } else {
      final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
      final diff = today.difference(lastDay).inDays;

      if (diff == 1) {
        currentStreak += 1;
      } else if (diff > 1) {
        currentStreak = 1;
      }
    }

    if (currentStreak > bestStreak) {
      bestStreak = currentStreak;
    }

    await prefs.setInt('currentStreak', currentStreak);
    await prefs.setInt('bestStreak', bestStreak);
    await prefs.setString('lastCompletedDate', today.toIso8601String());
  }
}
