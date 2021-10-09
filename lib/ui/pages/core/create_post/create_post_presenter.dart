import '../../../../domain/entities/entities.dart';
import '../../../helpers/errors/errors.dart';

abstract class CreatePostPresenter {
  Stream<UserEntity>? get user;

  void validPublishContent(String value);

  Future<void> addPublish();

  Stream<bool> get isValidPublish;
  Stream<UIError> get postErrorStream;
  Stream<String> get errorStream;
}
