/// A class that manages the theme mode of the app.
///
/// This class is responsible for toggling the theme mode between light and dark mode.
/// It extends [ChangeNotifier] to notify listeners when the theme mode is changed.
/// import 'package:flutter/cupertino.dart';
library;

import 'package:flutter/material.dart';

import '../utils/shared_preference.dart';

class ThemeManager with ChangeNotifier {
  /// The current theme mode of the app.
  ThemeMode _themeMode = ThemeMode.light;

  /// Getter for the current theme mode.
  get themeMode => _themeMode;

  /// Toggles the theme mode between light and dark mode.
  ///
  /// If [isDark] is true, the theme mode is set to dark mode. Otherwise, it is set to light mode.
  /// After the theme mode is changed, it notifies the listeners.
  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    saveTheme(isDark: isDark);
    notifyListeners();
  }
}
