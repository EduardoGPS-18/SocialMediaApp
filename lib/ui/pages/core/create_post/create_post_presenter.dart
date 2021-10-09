import '../../../../domain/entities/entities.dart';
import '../../../../presentation/presenters/shared/shared.dart';
import '../../../helpers/errors/errors.dart';

abstract class CreatePostPresenter implements Navigation {
  Stream<UserEntity>? get user;

  void validPublishContent(String value);

  Future<void> addPublish();

  Stream<bool> get isValidPublish;
  Stream<UIError> get postErrorStream;
  Stream<String> get errorStream;

  void updateUserId();
}
