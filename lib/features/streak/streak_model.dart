class StreakModel {
  final int currentStreak;
  final int bestStreak;
  final DateTime? lastCompletedDate;

  StreakModel({
    required this.currentStreak,
    required this.bestStreak,
    required this.lastCompletedDate,
  });



  factory StreakModel.fromMap(Map<String, dynamic> map) {
    return StreakModel(
      currentStreak: map['currentStreak'] ?? 0,
      bestStreak: map['bestStreak'] ?? 0,
      lastCompletedDate: map['lastCompletedDate'] != null
          ? DateTime.parse(map['lastCompletedDate'])
          : null,
    );
  }
}
