import 'package:flutter/material.dart';
import '../models/focus_note_model.dart';
import '../services/focus_notes_storage.dart';

class FocusNotesProvider extends ChangeNotifier {
  List<FocusNote> _notes = [];

  void addNote(String text) {
    _notes.add(FocusNote(text: text, time: DateTime.now()));
    FocusNotesStorage.save(_notes);
    notifyListeners();
  }
}
