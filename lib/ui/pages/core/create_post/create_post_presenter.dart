import 'package:social_media_app/ui/helpers/errors/errors.dart';

import '../../../../domain/entities/entities.dart';

abstract class CreatePostPresenter {
  Future<UserEntity> get user;

  void validPublishContent(String value);

  Future<void> addPublish();

  Stream<bool> get isValidPublish;
  Stream<UIError> get errorStream;
}
