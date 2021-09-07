import 'package:flutter/material.dart';

class ScaledImage extends StatelessWidget {
  const ScaledImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Image.asset(image),
    );
  }
}
