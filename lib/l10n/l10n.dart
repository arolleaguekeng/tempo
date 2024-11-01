import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('fr'),
    const Locale('ch'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'fr':
        return 'Français';
      case 'en':
      default:
        return 'English ';
    }
  }
}
