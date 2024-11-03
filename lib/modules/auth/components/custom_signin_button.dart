import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final Color backgroundColor;
  final Color borderColor;
  final void Function() onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.backgroundColor,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: borderColor,
            width: 0.2,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath,width: 30,height: 30,),
            const SizedBox(width: 20),
            Text(buttonText,style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
