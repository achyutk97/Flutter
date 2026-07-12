import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static const String _colorKey = 'selectedColor';

  /// Save color
  static Future<void> saveColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_colorKey, color.toARGB32());
  }

  /// Load color
  static Future<Color> loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    final int? storedColor = prefs.getInt(_colorKey);

    if (storedColor == null) {
      return const Color(0xFF4B0082); // default
    }

    return Color(storedColor); // ✅ THIS IS CORRECT
  }
}


