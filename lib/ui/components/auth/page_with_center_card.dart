import 'package:flutter/material.dart';

class PageWithCenterCard extends StatelessWidget {
  final Size size;
  final List<Widget> children;
  final PageController controller;

  const PageWithCenterCard({
    Key? key,
    required this.size,
    required this.children,
    required this.controller,
  }) : super(key: key);

  bool onWillPop() {
    if (controller.page?.round() == controller.initialPage) {
      return true;
    } else {
      controller.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Center(
        child: Container(
          height: size.height * 0.9,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
                spreadRadius: 1.0,
                offset: Offset(
                  2.0,
                  2.0,
                ),
              ),
            ],
            borderRadius: BorderRadius.circular(size.width * 0.015),
            color: Theme.of(context).colorScheme.background,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
