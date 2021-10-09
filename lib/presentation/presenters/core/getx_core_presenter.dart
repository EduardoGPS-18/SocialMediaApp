import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../ui/pages/pages.dart';

class GetxCorePresenter extends GetxController implements CorePresenter {
 
  ValueNotifier<int> pageIndexNofifierController = ValueNotifier<int>(0);
  @override
  ValueNotifier<int> get pageIndexNotifier => pageIndexNofifierController;
}
