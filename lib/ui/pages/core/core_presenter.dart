import 'package:flutter/foundation.dart';

abstract class CorePresenter {
  ValueNotifier<int> get pageIndexNotifier;
  Future<void> logout();
}
