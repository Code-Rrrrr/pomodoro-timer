import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FocusLockProvider extends ChangeNotifier {
  bool focusLockEnabled = false;
  bool sessionActive = false;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    focusLockEnabled = prefs.getBool('focusLockEnabled') ?? false;
    notifyListeners();
  }

  Future<void> toggleFocusLock(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    focusLockEnabled = value;
    await prefs.setBool('focusLockEnabled', value);
    notifyListeners();
  }

  void startSession() {
    sessionActive = true;
  }

  void endSession() {
    sessionActive = false;
  }
}
