import 'package:flutter/material.dart';

class CustomPageViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressed;
  final ValueNotifier<int> index;
  final List<String> pageViewNames;
  final List<Widget>? actions;

  const CustomPageViewAppBar({
    Key? key,
    this.onPressed,
    required this.index,
    required this.pageViewNames,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: index,
      builder: (context, value, _) => AppBar(
        elevation: 0,
        actions: actions,
        leading: onPressed != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                onPressed: onPressed,
              )
            : null,
        centerTitle: true,
        title: Text(
          pageViewNames[value],
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
