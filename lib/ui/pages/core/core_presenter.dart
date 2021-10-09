import 'package:flutter/foundation.dart';

import '../../../domain/entities/entities.dart';

abstract class CorePresenter {
  Stream<List<PublishEntity>> get loadPublishesByUserID;
  Stream<List<PublishEntity>> get loadRecentPublishes;
  Stream<UserEntity> get loadUserData;
  Stream<String> get handlingError;
  ValueNotifier<int> get pageIndexNotifier;

  Future<void> addComment(String publishId, String content);
  Future<void> deleteComment(String publishId, String commentId);
  Future<void> addPublish(String content);
  Future<void> deletePublish(String publishId);
  Future<void> likePublish(String publishId);
  Future<void> unlikePublish(String publishId);

  void updateUserId();
}
