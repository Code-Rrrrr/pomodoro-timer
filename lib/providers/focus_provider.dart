import 'package:flutter/material.dart';
import '../models/focus_session.dart';

class FocusProvider extends ChangeNotifier {
  final List<FocusSession> _sessions = [];

  List<FocusSession> get sessions => _sessions;

  void addSession(FocusSession session) {
    _sessions.add(session);
    notifyListeners();
  }

  double get averageFocus {
    if (_sessions.isEmpty) return 0;
    return _sessions.map((s) => s.rating).reduce((a, b) => a + b) /
        _sessions.length;
  }
}
