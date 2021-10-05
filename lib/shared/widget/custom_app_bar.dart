import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Function()? onPressed;
  const CustomAppBar({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: onPressed != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: onPressed,
            )
          : null,
      centerTitle: true,
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline6?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
