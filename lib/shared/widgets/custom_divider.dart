import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;

  const CustomDivider({
    Key? key,
    required this.height,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * height,
      color: Theme.of(context).colorScheme.onBackground.withAlpha(40),
    );
  }
}
