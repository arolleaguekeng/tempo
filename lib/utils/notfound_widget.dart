import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants.dart';
import 'helper_widgets.dart';

class NotFoundWidget extends StatefulWidget {
  const NotFoundWidget(
      {super.key,
      required this.message,
      this.image = 'assets/images/png/not-found-2.png',
      required this.action});
  final String message;
  final String image;
  final VoidCallback? action;
  @override
  State<NotFoundWidget> createState() => _NotFoundWidgetState();
}

class _NotFoundWidgetState extends State<NotFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(appPadding),
          Image.asset(
            widget.image,
            height: 150,
            width: 200,
            fit: BoxFit.contain,
          ),
          Text(
            widget.message,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          addVerticalSpace(appPadding),
          InkWell(
            onTap: widget.action,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                AppLocalizations.of(context)!.hello,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
