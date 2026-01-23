import 'package:flutter/material.dart';
import '../models/focus_note_model.dart';
import '../services/focus_notes_storage.dart';

class FocusNotesProvider extends ChangeNotifier {
  List<FocusNote> _notes = [];

  List<FocusNote> get todayNotes {
    final today = DateTime.now();
    return _notes.where((n) =>
    n.time.year == today.year &&
        n.time.month == today.month &&
        n.time.day == today.day).toList();
  }

  FocusNotesProvider() {
    _load();
  }

  Future<void> _load() async {
    _notes = await FocusNotesStorage.load();
    notifyListeners();
  }

  void addNote(String text) {
    _notes.add(FocusNote(text: text, time: DateTime.now()));
    FocusNotesStorage.save(_notes);
    notifyListeners();
  }
}
