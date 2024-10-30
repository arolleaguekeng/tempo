/// This file contains the constants for the light and dark themes used in the app.
/// It imports the material.dart and constants.dart files.
/// The [COLOR_PRIMARY] and [COLOR_ACCENT] constants are defined using the Colors class from material.dart.
/// The [lightTheme] and [darkTheme] constants are defined using the ThemeData class from material.dart.
/// The [lightTheme] constant is used for the light theme of the app and the [darkTheme] constant is used for the dark theme of the app.
/// The [lightTheme] and [darkTheme] constants define the font family, brightness, primary color, floating action button theme, elevated button theme, and input decoration theme for the app.
library;

// Importing the material.dart and constants.dart files
import 'package:flutter/material.dart';
import 'package:tempo/utils/constants.dart';

// Defining the primary and accent colors for the app
const colorPrimary = Colors.deepOrangeAccent;
const colorAccent = Colors.orange;
const buttonBorderRadius = 20.0;
const buttonHorizontalPadding = 30.0;
const buttonVerticalPadding = 13.0;

// Defining the light theme for the app
ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),

    // color scheme for the app
    colorScheme: const ColorScheme.light(
        primary: primaryColor, secondary: primaryColor, surface: white),

    /// Defines the elevated button theme for the app.
    /// The [padding] defines the padding for the elevated button.
    /// The [shape] defines the shape for the elevated button.
    /// The [backgroundColor] defines the background color for the elevated button.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
              horizontal: buttonHorizontalPadding,
              vertical: buttonVerticalPadding),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(primaryColor),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(Colors.white30),
      ),
    ),

    // outlined button theme for the app

    outlinedButtonTheme: oulinButtonThemeOption(),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
              horizontal: buttonHorizontalPadding,
              vertical: buttonVerticalPadding),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
          ),
        ),
        overlayColor: WidgetStateProperty.all(Colors.white30),
      ),
    ),

    /// Defines the input decoration theme for the app.
    /// The [border] defines the border for the input decoration theme.
    /// The [filled] defines whether the input decoration should be filled or not.
    /// The [fillColor] defines the fill color for the input decoration.
    /// The [activeIndicatorBorder] defines the border for the active indicator of the input decoration.
    /// The [focusedBorder] defines the border for the input decoration when it is focused.
    inputDecorationTheme: inputDecorationLightTheme(),
    dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputDecorationLightTheme()));

OutlinedButtonThemeData oulinButtonThemeOption() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
          horizontal: buttonHorizontalPadding, vertical: buttonVerticalPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonBorderRadius),
      ),
      side: const BorderSide(
        color: primaryColor,
        width: 1.4,
      ),
    ),
  );
}

InputDecorationTheme inputDecorationLightTheme() {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(
        horizontal: buttonHorizontalPadding,
        vertical: buttonVerticalPadding + 5),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
    activeIndicatorBorder: const BorderSide(
      color: Colors.red,
      width: 2.0,
      style: BorderStyle.solid,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
      borderSide: const BorderSide(color: primaryColor, width: 1.6),
    ),
  );
}

// Defining the dark theme for the app
ThemeData darkTheme = ThemeData(
  /// Sets the font family, brightness, hint color, and switch theme for the dark theme of the app.
  /// The [fontFamily] sets the font family for the dark theme.
  /// The [brightness] sets the brightness for the dark theme.
  /// The [hintColor] sets the hint color for the dark theme.
  /// The [switchTheme] sets the track color and thumb color for the switch in the dark theme.
  fontFamily: 'Montserrat',
  hintColor: Colors.white,
  useMaterial3: true,
  cardColor: Colors.grey[900],
  colorScheme: const ColorScheme.dark(
      primary: primaryColor, secondary: primaryColor, surface: darkTone),

  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.all(Colors.grey),
    thumbColor: WidgetStateProperty.all(Colors.white),
  ),

  /// Defines the input decoration theme for the app.
  /// The [border] defines the border for the input decoration theme.
  /// The [filled] defines whether the input decoration should be filled or not.
  /// The [fillColor] defines the fill color for the input decoration.
  /// The [activeIndicatorBorder] defines the border for the active indicator of the input decoration.
  /// The [focusedBorder] defines the border for the input decoration when it is focused.
  inputDecorationTheme: inputDecorationLightTheme(),

  /// Defines the elevated button theme for the app.
  /// The [padding] defines the padding for the elevated button.
  /// The [shape] defines the shape for the elevated button.
  /// The [backgroundColor] defines the background color for the elevated button.
  /// The [foregroundColor] defines the foreground color for the elevated button.
  /// The [overlayColor] defines the overlay color for the elevated button.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
            horizontal: buttonHorizontalPadding,
            vertical: buttonVerticalPadding),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
      ),
      backgroundColor: WidgetStateProperty.all(primaryColor),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      overlayColor: WidgetStateProperty.all(Colors.white30),
    ),
  ),
  outlinedButtonTheme: oulinButtonThemeOption(),
);
