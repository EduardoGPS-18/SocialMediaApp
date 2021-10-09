import 'package:flutter/widgets.dart';
import '../../../domain/entities/entities.dart';
import '../../helpers/errors/errors.dart';

abstract class PostPresenter {
  Stream<UIError> get errorStream;
  Stream<bool> get isValidComment;
  Stream<List<CommentEntity>> comments({required String publishId});
  Stream<PublishEntity> getPublishById({required String id});
  Stream<UserEntity> get currentUser;
  Stream<UserEntity> loadUserById({required String id});

  Future<void> likeClick({required String publishId});
  Future<void> addComment({required String publishId});

  TextEditingController get commentTextFieldController;

  void validateComment(String comment);
}
