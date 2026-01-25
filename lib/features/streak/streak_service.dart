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


}
