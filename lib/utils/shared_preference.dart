import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';
import 'providers/local_provider.dart';

// save language
Future<void> saveLanguage({required String language}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('language', language);
}

void getLanguage(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final provider = Provider.of<LocaleProvider>(context, listen: false);
  provider.setLocale(Locale(prefs.getString('language') ?? 'en'));
}

// save theme
Future<void> saveTheme({required bool isDark}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('theme', isDark);
}

void getTheme(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final provider = Provider.of<ThemeManager>(context, listen: false);
  var isDark = prefs.getBool('theme') ?? false;
  provider.toggleTheme(isDark);
}
