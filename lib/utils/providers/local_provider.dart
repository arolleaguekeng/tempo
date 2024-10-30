import 'package:flutter/material.dart';
import 'package:tempo/main.dart';

import '../../l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale = const Locale.fromSubtags(languageCode: 'en');

  Locale get locale => _locale ?? const Locale.fromSubtags(languageCode: 'en');

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    MyApp.currentLanguage = locale.languageCode;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
