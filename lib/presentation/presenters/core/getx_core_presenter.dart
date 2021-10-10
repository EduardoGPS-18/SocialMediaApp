import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';
import '../shared/shared.dart';

class GetxCorePresenter extends GetxController with UpdateUserId implements CorePresenter {
  Logout remoteLogout;
  LoadUser remoteLoadUser;
  @override
  GetUserId localGetUserId;

  GetxCorePresenter({
    required this.remoteLogout,
    required this.remoteLoadUser,
    required this.localGetUserId,
  });

  String? _userId;
  @override
  set userId(String? user) => _userId = user;
  @override
  String? get userId => _userId;

  ValueNotifier<int> pageIndexNofifierController = ValueNotifier<int>(0);
  @override
  ValueNotifier<int> get pageIndexNotifier => pageIndexNofifierController;

  Rx<String> get pathStreamController => Rx("");

  Stream<String> get pathStream => pathStreamController.stream;

  @override
  Future<void> logout() async {
    await Get.offAllNamed("/auth");
    await remoteLogout.logout();
  }

  @override
  Rx<String> errorStreamController = Rx("");
  Stream<String> get errorStream => errorStreamController.stream;
}
