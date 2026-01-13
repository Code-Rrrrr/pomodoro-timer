import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF22C55E),
      secondary: Color(0xFF38BDF8),
    ),
  );
}
