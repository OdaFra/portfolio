import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.dark();

  ThemeData get theme => _theme;

  void toogleTheme() {
    final isDarkMode = _theme == ThemeData.dark();
    if (isDarkMode) {
      _theme = ThemeData.dark();
    } else {
      _theme = ThemeData.light();
    }
    notifyListeners();
  }
}
