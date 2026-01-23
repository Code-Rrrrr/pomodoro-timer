class FocusNote {
  final String text;
  final DateTime time;

  FocusNote({
    required this.text,
    required this.time,
  });

  Map<String, dynamic> toMap() => {
    'text': text,
    'time': time.toIso8601String(),
  };

  factory FocusNote.fromMap(Map<String, dynamic> map) {
    return FocusNote(
      text: map['text'],
      time: DateTime.parse(map['time']),
    );
  }
}
