import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../ui/pages/pages.dart';

class GetxCorePresenter extends GetxController implements CorePresenter {
  ValueNotifier<int> pageIndexNofifierController = ValueNotifier<int>(0);
  @override
  ValueNotifier<int> get pageIndexNotifier => pageIndexNofifierController;
}
