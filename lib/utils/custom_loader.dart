import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'constants.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader(
      {super.key, this.size = 50, this.color = primaryColor, this.text = ''});
  final double size;
  final Color color;
  final String text;
  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: LoadingAnimationWidget.fallingDot(
          color: widget.color,
          size: widget.size,
        )),
        if(widget.text.isNotEmpty)
        Text(
          widget.text,
          style: TextStyle(color: widget.color),
        )
      ],
    );
  }
}
