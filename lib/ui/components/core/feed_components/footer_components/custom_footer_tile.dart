import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final int content;
  final Function()? onTap;
  final String label;
  final Size size;
  final IconData icon;
  const CustomTile({
    Key? key,
    required this.content,
    required this.onTap,
    required this.label,
    required this.size,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
          ),
          child: IconButton(
            iconSize: size.width * 0.07,
            onPressed: onTap,
            icon: Icon(
              icon,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text.rich(
            TextSpan(
              text: "$content",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              children: [
                TextSpan(
                  text: " $label",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
