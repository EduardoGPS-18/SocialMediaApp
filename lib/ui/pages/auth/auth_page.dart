import 'package:flutter/material.dart';

import '../pages.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

bool _segureText = true;

class _AuthPageState extends State<AuthPage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.0,
            child: Container(
              height: size.height * 0.4,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          PageView(
            controller: pageController,
            children: [
              Positioned(
                left: size.width * 0.05,
                right: size.width * 0.05,
                bottom: size.height * 0.05,
                top: size.height * 0.05,
                child: LoginPage(
                  size: size,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
left: widget.size.width * 0.05,
      right: widget.size.width * 0.05,
      bottom: widget.size.height * 0.05,
      top: widget.size.height * 0.05,
*/