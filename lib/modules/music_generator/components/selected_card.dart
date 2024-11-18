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
      margin: const EdgeInsets.symmetric(vertical: basicPadding,horizontal: smallPadding),
      child: Card(
        color: primaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(largePadding),
          title: Text(
            title,
            style: const TextStyle(
              color: white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(basicPadding),
            child: Text(
              subtitle,
              style: const TextStyle(
                color: white,
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
