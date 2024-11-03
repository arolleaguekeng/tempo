import 'package:flutter/material.dart';

import '../page/welcome_screen.dart';

extension NavigationExtensions on BuildContext {
  Future<void> goWelcomePage() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.push(this, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
