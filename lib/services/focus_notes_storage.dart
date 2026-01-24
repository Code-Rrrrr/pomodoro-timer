import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/focus_note_model.dart';

class FocusNotesStorage {
  static const _key = 'focus_notes';

  static Future<void> save(List<FocusNote> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final data = notes.map((e) => jsonEncode(e.toMap())).toList();
    await prefs.setStringList(_key, data);
  }

  static Future<List<FocusNote>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    return raw
        .map((e) => FocusNote.fromMap(jsonDecode(e)))
        .toList();
  }
}
