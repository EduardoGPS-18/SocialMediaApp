import 'package:flutter/material.dart';

class RouteAnimations {
  final Widget route;
  final int duration;
  final Object? arguments;
  final String routeName;

  RouteAnimations({
    required this.route,
    required this.duration,
    this.arguments,
    required this.routeName,
  });

  Route slide() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => route,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: duration),
        settings: RouteSettings(arguments: arguments, name: routeName));
  }

  Route opacityTransition(double opacity) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, _) => route,
        transitionsBuilder: (context, animation, _, child) {
          var tween = Tween(begin: 0.0, end: 1.0);
          return FadeTransition(opacity: animation.drive(tween), child: child);
        },
        transitionDuration: Duration(milliseconds: duration),
        settings: RouteSettings(arguments: arguments, name: routeName));
  }
}
