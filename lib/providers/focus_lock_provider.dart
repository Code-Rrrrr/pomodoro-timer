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
