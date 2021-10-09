import 'package:flutter/widgets.dart';
import '../../../helpers/helpers.dart';
import '../../../../../../domain/entities/entities.dart';

abstract class FeedPresenter {
  Stream<UserEntity> loadUserEntityById({required String uid});
  void likeClick({required String publishId});
  Future<void> removePublish({required String publishId});

  Stream<String> get userCommunicateStream;
  Stream<UserEntity> get user;
  Stream<List<PublishEntity>> get publishStream;
  Stream<bool> get isValidPublish;
  Stream<UIError> get errorStream;

  TextEditingController get publishTextFieldController;

  Future<void> addPublish();
  void validPublishContent(String value);
}
