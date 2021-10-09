import 'package:flutter/widgets.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../helpers/helpers.dart';

abstract class FeedPresenter {
  Future<void> addPublish();
  Future<void> removePublish({required String publishId});
  Stream<UserEntity> loadUserEntityById({required String uid});

  Stream<bool> get isValidPublish;
  Stream<String> get userCommunicateStream;
  Stream<UIError> get publishErrorStream;
  Stream<String> get errorStream;
  Stream<UserEntity> get user;
  Stream<List<PublishEntity>> get publishStream;

  TextEditingController get publishTextFieldController;

  void likeClick({required String publishId});
  void validPublishContent(String value);
}
