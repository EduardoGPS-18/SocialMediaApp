import 'package:flutter/widgets.dart';
import 'package:social_media_app/presentation/presenters/shared/shared.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../helpers/helpers.dart';

abstract class FeedPresenter implements Navigation{
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

  void updateUserId();
  void likeClick({required String publishId});
  void validPublishContent(String value);
}
