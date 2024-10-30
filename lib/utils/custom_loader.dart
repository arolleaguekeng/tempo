import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'constants.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key, this.size = 50, this.color = primaryColor});
  final double size;
  final Color color;
  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
      color: widget.color,
      size: widget.size,
    ));
  }
}
