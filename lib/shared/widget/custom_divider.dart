import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  double altura;
  CustomDivider({
    Key? key,
    required this.altura,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * altura,
      color: Theme.of(context).colorScheme.onBackground.withAlpha(40),
    );
  }
}
