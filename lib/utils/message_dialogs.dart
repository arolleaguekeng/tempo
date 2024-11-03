import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';
import 'helper_widgets.dart';
import 'package:http/http.dart' as http;

void messageDialog(
    {required IconData icon,
    required BuildContext context,
    required String text,
    required Color iconColor,
    required Color bgColor}) {
  var fToast = FToast();
  // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: bgColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: white,
            )),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          flex: 8,
          child: AutoSizeText(
            text,
            maxLines: 3,
            style: const TextStyle(color: white),
          ),
        ),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 2),
    // positionedToastBuilder: (context, child) {
    //   return Positioned(
    //     top: 16.0,
    //     left: 16.0,
    //     child: child,
    //   );
    // }
  );
}

void succesDialod(BuildContext context, String message) {
  messageDialog(
      icon: Icons.check_circle_outline,
      text: "Succesfull operation",
      iconColor: primaryColor,
      context: context,
      bgColor: green);
}

void errorDialog(BuildContext context, String message) {
  messageDialog(
      icon: Icons.error_outline,
      text: message,
      iconColor: Colors.red,
      context: context,
      bgColor: red);
}

void apiSuccesDialod(BuildContext context, http.Response? response) {
  messageDialog(
      icon: Icons.check_circle_outline,
      text: "Succesfull operation",
      iconColor: primaryColor,
      context: context,
      bgColor: green);
}

void apiErrorDialog(BuildContext context, http.Response? response) {
  messageDialog(
      icon: Icons.error_outline,
      text: jsonDecode(response!.body)["errors"].keys.first,
      iconColor: Colors.red,
      context: context,
      bgColor: red);
}

void apiErrorCustomDialog(BuildContext context, String text) {
  messageDialog(
      icon: Icons.error_outline,
      text: text,
      iconColor: Colors.red,
      context: context,
      bgColor: red);
}

void apiServerErrorDialog(BuildContext context, http.Response? response) {
  messageDialog(
      icon: Icons.error_outline,
      text: "An error occured on the server",
      iconColor: Colors.red,
      context: context,
      bgColor: red);
}

void apiNoInternetDialog(BuildContext context, http.Response? response) {
  messageDialog(
      icon: Icons.wifi_off,
      text: "No internet connection",
      iconColor: Colors.red,
      context: context,
      bgColor: red);
}

void informationDialog(
    {required BuildContext context,
    required String text,
    IconData icon = Icons.info_outline}) {
  messageDialog(
      icon: icon,
      text: text,
      iconColor: primaryColor,
      context: context,
      bgColor: secondaryColor);
}

Widget successContainer(BuildContext context) {
  return Container(
    height: 200,
    padding: const EdgeInsets.all(appPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: primaryColor,
          size: 40,
        ),
        addVerticalSpace(height: appPadding),
        const Text("Succesfull operation"),
        addVerticalSpace(height: appPadding),
      ],
    ),
  );
}

Widget errorContainer(BuildContext context) {
  return Container(
    height: 200,
    padding: const EdgeInsets.all(appPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 40,
        ),
        addVerticalSpace(height: appPadding),
        const Text("An error occured"),
        addVerticalSpace(height: appPadding),
      ],
    ),
  );
}

Widget notFoundContainer(BuildContext context) {
  return Container(
    height: 200,
    padding: const EdgeInsets.all(appPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 40,
        ),
        addVerticalSpace(height: appPadding),
        const Text("Not found items"),
        addVerticalSpace(height: appPadding),
      ],
    ),
  );
}

Widget serverErrorContainer(BuildContext context) {
  return Container(
    height: 200,
    padding: const EdgeInsets.all(appPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 40,
        ),
        addVerticalSpace(height: appPadding),
        const Text("Server error occured"),
        addVerticalSpace(height: appPadding),
      ],
    ),
  );
}

Widget noInternetContainer(BuildContext context) {
  return Container(
    height: 200,
    padding: const EdgeInsets.all(appPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.wifi_off,
          color: Colors.red,
          size: 40,
        ),
        addVerticalSpace(height: appPadding),
        const Text("No internet connection"),
        addVerticalSpace(height: appPadding),
      ],
    ),
  );
}

Future<void> showMessages(BuildContext context, http.Response? response) async {
  if (response == null) {
    apiNoInternetDialog(context, response);
  } else {
    if (response.statusCode == 400 ||
        response.statusCode == 403 ||
        response.statusCode == 409) {
      apiErrorDialog(context, response);
    }
    if (response.statusCode == 500) {
      apiServerErrorDialog(context, response);
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      apiSuccesDialod(context, response);
    }
  }
}

Widget showMessagesTexts(BuildContext context, http.Response? response) {
  if (response == null) {
    return noInternetContainer(context);
  }
  if (response.statusCode == 400) {
    return errorContainer(context);
  }
  if (response.statusCode == 404) {
    return notFoundContainer(context);
  }
  if (response.statusCode == 500) {
    return serverErrorContainer(context);
  }
  if (response.statusCode == 200 || response.statusCode == 201) {
    return successContainer(context);
  }
  return Container();
}
