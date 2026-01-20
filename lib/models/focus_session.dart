class FocusSession {
  final DateTime date;
  final int rating; // 1–5
  final String? note;

  FocusSession({
    required this.date,
    required this.rating,
    this.note,
  });
}
