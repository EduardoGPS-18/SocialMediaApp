import 'package:get/get.dart';

import '../../../domain/usecases/get_user_id.dart';
import '../../../ui/helpers/helpers.dart';

mixin UpdateUserId {
  String? get userId;
  set userId(String? v);
  Rx<String> get errorStreamController;
  GetUserId get localGetUserId;

  void updateUserId() {
    try {
      userId = localGetUserId.getUserId();
      if (userId == null) {
        print("USUÁRIO NULO");
      }
    } catch (_) {
      errorStreamController.subject.add(R.string.expiredUser);
    }
  }
}
