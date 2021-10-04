import 'package:flutter/material.dart';

class PageWithCenterCard extends StatelessWidget {
  final Size size;
  final List<Widget> children;

  const PageWithCenterCard({Key? key, required this.size, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: size.width * 0.05,
      right: size.width * 0.05,
      bottom: size.height * 0.05,
      top: size.height * 0.05,
      child: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
