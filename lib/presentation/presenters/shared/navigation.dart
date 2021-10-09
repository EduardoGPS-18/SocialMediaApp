import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

mixin NavigationImpl {
  Rx<String> get pathStreamController => Rx("");
  Stream<String> get pathStream => pathStreamController.stream;
}
mixin NavigationController {
  Stream<String> get pathStream;
  void navigate(BuildContext context) {
    pathStream.listen((event) {
      Navigator.of(context).pushNamedAndRemoveUntil(event, (route) => true);
    });
  }
}
mixin Navigation {
  Rx<String> get pathStreamController;

  Stream<String> get pathStream;
}
