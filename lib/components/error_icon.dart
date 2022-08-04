import 'package:flutter/material.dart';

class ErrorIcon extends StatelessWidget {
  const ErrorIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.broken_image,
          size: 48, semanticLabel: 'Image unavailable'),
    );
  }
}
