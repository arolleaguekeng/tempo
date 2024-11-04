import 'package:flutter/material.dart';
import 'package:tempo/utils/constants.dart';

Widget cardSelected({
  required String title,
  required String subtitle,
  required String image,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: basicPagging),
      child: Card(
        color: darkprimaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(largePadding),
          title: Text(
            title,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(basicPagging),
            child: Text(
              subtitle,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 12,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          leading: Image.asset(
            image,
            height: 100,
            width: 100,
          ),
        ),
      ),
    ),
  );
}
