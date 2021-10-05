import 'package:equatable/equatable.dart';

import 'comment_entity.dart';

class PublishEntity extends Equatable {
  final String id;
  final String uid;
  final List<CommentEntity> comments;
  final List<String> uidOfWhoLikedIt;
  final String content;
  final DateTime createdAt;

  const PublishEntity({
    required this.id,
    required this.uid,
    required this.comments,
    required this.uidOfWhoLikedIt,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [id, uid, comments, uidOfWhoLikedIt, content, createdAt];
}
