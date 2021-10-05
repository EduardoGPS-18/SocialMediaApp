import 'package:equatable/equatable.dart';

import 'comment_entity.dart';

class PublishEntity extends Equatable {
  final String userId;
  final String uid;
  final List<CommentEntity> comments;
  final List<String> uidOfWhoLikedIt;
  final String content;
  final DateTime createdAt;

  const PublishEntity({
    required this.userId,
    required this.uid,
    required this.comments,
    required this.uidOfWhoLikedIt,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [userId, uid, comments, uidOfWhoLikedIt, content, createdAt];
}
