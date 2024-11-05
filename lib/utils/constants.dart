/// This file contains the constants used throughout the app, including colors, text themes, and padding.
///
/// [primaryColor] is the primary color used in the app.
/// [secondaryColor] is the secondary color used in the app.
/// [bgColor] is the background color used in the app.
/// [darkTone] is a dark tone used in the app.
/// [lightIconBg] is a light background color used for icons in the app.
/// [darkIconBg] is a dark background color used for icons in the app.
/// [transparent] is a transparent color used in the app.
/// [textColor] is the color used for text in the app.
/// [textLightColor] is a light color used for text in the app.
/// [grey] is a grey color used in the app.
/// [white] is a white color used in the app.
/// [purple] is a purple color used in the app.
/// [orange] is an orange color used in the app.
/// [green] is a green color used in the app.
/// [red] is a red color used in the app.
/// [textTheme] is a function that returns the text theme used in the app.
/// [themeIsDark] is a function that returns a boolean indicating whether the app is in dark mode.
/// [appPadding] is the default padding used in the app.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempo/theme/theme_manager.dart';

// Colors used in this app
const primaryColor = Color.fromRGBO(51, 171, 189, 1);
const secondaryColor = Color.fromRGBO(0, 0, 0, 1);
const darkprimaryColor = Color.fromRGBO(7, 39, 44, 1);
const bgColor = tonGray2;
const bgDarkColor = darkTone;

const darkTone = Color.fromRGBO(25, 25, 28, 1.0);
const darkTon1 = Color.fromRGBO(25, 25, 28, 1.0);
const darkTon2 = Color.fromRGBO(25, 25, 28, 1.0);
const darkTon3 = Color.fromRGBO(35, 37, 47, 1.0);

const tonGray5 = Color.fromRGBO(108, 118, 138, 1.0);
const tonGray4 = Color.fromRGBO(160, 171, 192, 1.0);
const tonGray3 = Color.fromRGBO(184, 191, 204, 1.0);
const tonGray2 = Color.fromRGBO(234, 236, 240, 1.0);
const tonGray1 = Color.fromRGBO(248, 248, 248, 1.0);

const textColor = Color.fromARGB(255, 55, 50, 50);
const textLightColor = Color.fromRGBO(184, 191, 204, 1.0);

const transparent = Colors.transparent;
const grey = Color.fromRGBO(148, 170, 220, 1);
const white = Color.fromRGBO(255, 255, 255, 1.0);
const purple = Color.fromRGBO(165, 80, 179, 1);
const orange = Color.fromRGBO(251, 137, 13, 1);
const green = Color.fromRGBO(3, 176, 107, 1);
const red = Color.fromARGB(255, 242, 100, 90);

TextTheme textTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

bool themeIsDark(BuildContext context) {
  ThemeMode themeMode = ThemeMode.light;
  if (Provider.of<ThemeManager>(context).themeMode == ThemeMode.dark) {
    return true;
  } else {
    return false;
  }
}

bool defauldIsDark(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return isDarkMode;
}

// Default App Padding
const basicPagging = 8.0;
const appPadding = 16.0;
const largePadding = 32.0;
const superLargePadding = 64.0;

const googleApiKey = "AIzaSyDkenoJU2mp21o2v4FC9ETAnUGhIKjM1Sc";
