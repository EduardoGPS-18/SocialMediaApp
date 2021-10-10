import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';

class GetxCorePresenter extends GetxController implements CorePresenter {
  Logout remoteLogout;
  GetxCorePresenter({
    required this.remoteLogout,
  });
  ValueNotifier<int> pageIndexNofifierController = ValueNotifier<int>(0);
  @override
  ValueNotifier<int> get pageIndexNotifier => pageIndexNofifierController;

  @override
  Future<void> logout() async {
    await remoteLogout.logout();
  }
}
