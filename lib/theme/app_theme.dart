import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF4C6EF5);
  static const Color accent = Color(0xFFFFD166);

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF7F8FC),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 2,
      titleTextStyle: TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 24,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontFamily: 'Pacifico', fontSize: 26),
      titleMedium: TextStyle(fontFamily: 'Kalam', fontWeight: FontWeight.w700, fontSize: 18),
      bodyMedium: TextStyle(fontFamily: 'Kalam', fontSize: 16),
      bodySmall: TextStyle(fontFamily: 'Kalam', fontSize: 13),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F2233),
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 24,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontFamily: 'Pacifico', fontSize: 26, color: Colors.white),
      titleMedium: TextStyle(fontFamily: 'Kalam', fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
      bodyMedium: TextStyle(fontFamily: 'Kalam', fontSize: 16, color: Colors.white70),
      bodySmall: TextStyle(fontFamily: 'Kalam', fontSize: 13, color: Colors.white60),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
