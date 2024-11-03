/// This file contains helper widgets that can be used throughout the app.
/// These widgets include:
/// - `addVerticalSpace` and `addHorizontalSpace` which return a `SizedBox` with a specified height or width respectively.
/// - `headlineMediumText`, `headlineSmallText`, and `heardlineLargeText` which return an `AutoSizeText` widget with a specified text and style.
/// - `captionText` which returns a `Text` widget with a specified text and style.
/// - `CustomIconButton` which returns a `Container` with a `IconButton` widget inside it, with a specified icon, size, and color.
/// - `CustomAppBar` which returns an `AppBar` widget with a specified title and leading and trailing icons.
/// - `customDialog` which returns a `Future` that shows a dialog with a specified widget inside it.
library;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'responsive.dart';

/// Returns a [SizedBox] widget with a specified height.
///
/// The [height] parameter is required and specifies the height of the [SizedBox] widget.
///
/// Example usage:
///
/// ```dart
/// addVerticalSpace(20),
/// ```
Widget addVerticalSpace({double height = appPadding}) {
  return SizedBox(
    height: height,
  );
}

/// Returns a [SizedBox] widget with a specified width.
///
/// The [width] parameter is required and specifies the width of the [SizedBox] widget.
///
/// Example usage:
///
/// ```dart
/// addHorizontalSpace(),
/// ```
Widget addHorizontalSpace({double width = appPadding}) {
  return SizedBox(
    width: width,
  );
}

/// Returns an [AutoSizeText] widget with a specified text and style for a medium headline.
///
/// The [text] parameter is required and specifies the text to be displayed in the [AutoSizeText] widget.
///
/// The [context] parameter is required and specifies the build context.
///
/// The [textAlign] parameter is optional and specifies the alignment of the text. The default value is [TextAlign.left].
///
/// Example usage:
///
/// ```dart
/// headlineMediumText(
///   text: 'This is a medium headline',
///   context: context,
/// );
/// ```
AutoSizeText headlineMediumText(
    {required String text,
    required BuildContext context,
    maxLine = 3,
    textAlign = TextAlign.left}) {
  // auto size text
  return AutoSizeText(
    text,
    style: TextStyle(fontSize: Responsive.isMobile(context) ? 23 : 32),
    maxLines: maxLine,
    textAlign: textAlign,
  );
}

/// Returns an [AutoSizeText] widget with a specified text and style for a small headline.
///
/// The [text] parameter is required and specifies the text to be displayed in the [AutoSizeText] widget.
///
/// The [context] parameter is required and specifies the build context.
///
/// The [textAlign] parameter is optional and specifies the alignment of the text. The default value is [TextAlign.left].
///
/// Example usage:
///
/// ```dart
/// headlineSmallText(
///   text: 'This is a small headline',
///   context: context,
/// );
/// ```
AutoSizeText headlineSmallText(
    {required String text,
    required BuildContext context,
    maxLine = 3,
    textAlign = TextAlign.left}) {
  // auto size text
  return AutoSizeText(
    text,
    maxLines: maxLine,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: Responsive.isMobile(context) ? 14 : 24,
      fontWeight: FontWeight.w400,
      color: themeIsDark(context) ? white : textLightColor,
    ),
  );
}

/// Returns an [AutoSizeText] widget with a specified text and style for a large headline.
///
/// The [text] parameter is required and specifies the text to be displayed in the [AutoSizeText] widget.
///
/// The [context] parameter is required and specifies the build context.
///
/// Example usage:
///
/// ```dart
/// heardlineLargeText(
///   text: 'This is a large headline',
///   context: context,
/// );
/// ```
AutoSizeText heardlineLargeText(
    {required String text, required BuildContext context}) {
  // auto size text
  return AutoSizeText(
    text,
    style: textTheme(context).headlineLarge?.copyWith(
        color: themeIsDark(context) ? Colors.white : Colors.black,
        fontWeight: FontWeight.w900),
  );
}

/// Returns a [Text] widget with a specified text and style.
///
/// The [text] parameter is required and specifies the text to be displayed in the [Text] widget.
///
/// The [context] parameter is required and specifies the build context.
///
/// Example usage:
///
/// ```dart
/// captionText(
///   text: 'This is a caption',
///   context: context,
/// );
/// ```
Text captionText({required String text, required BuildContext context}) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}

/// Returns a custom [AppBar] widget with a back button and a centered title.
///
/// The [context] parameter is required and specifies the build context.
///
/// The [title] parameter is required and specifies the title of the [AppBar].
///
/// Example usage:
///
/// ```dart
/// CustomAppBar(context: context, title: 'My App Title');
/// ```
AppBar CustomAppBar({
  required BuildContext context,
  required String title,
  Widget? popupMenu,
  bool showLeading = true,
  bool centerTitle = true,
}) {
  return AppBar(
    titleSpacing: 0,
    centerTitle: centerTitle,
    foregroundColor: white,
    elevation: 0,
    backgroundColor: primaryColor,
    leadingWidth: 60,
    leading: showLeading == false
        ? null
        : Padding(
            padding: const EdgeInsets.all(7),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
    title: Row(
      children: [
        if (centerTitle == false) addHorizontalSpace(width: appPadding),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    actions: [if (popupMenu != null) popupMenu, addHorizontalSpace(width: 8)],
  );
}

/// Displays a custom dialog with the given [widget] as its child.
/// Returns a [Future] that resolves to the value (if any) that was passed to [Navigator.pop] when the dialog was closed.
Future<dynamic> customDialog(
    {required BuildContext context,
    required Widget widget,
    insetPadding = appPadding}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          insetPadding: EdgeInsets.all(insetPadding),
          child: Container(child: widget),
        );
      });
}

Future<dynamic> customShowModalBottomSheet(
    {required BuildContext context,
    required Widget widget,
    insetPadding = appPadding}) {
  return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(
              left: appPadding * 2,
              right: appPadding * 2,
              top: appPadding,
              bottom: appPadding),
          child: Container(child: widget),
        );
      });
}
