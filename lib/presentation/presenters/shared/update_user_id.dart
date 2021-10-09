import 'package:get/get.dart';

import '../../../domain/usecases/get_user_id.dart';
import '../../../ui/helpers/helpers.dart';
import 'shared.dart';

mixin UpdateUserId implements Navigation {
  String? get userId;
  set userId(String? v);
  Rx<String> get errorStreamController;
  GetUserId get localGetUserId;

  void updateUserId() {
    try {
      userId = localGetUserId.getUserId();
      if (userId == null) {
        pathStreamController.subject.add('/auth');
      }
    } catch (_) {
      errorStreamController.subject.add(R.string.expiredUser);
    }
  }
}
