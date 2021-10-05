import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String userId;
  final String publishId;
  final String uid;
  final String content;
  final DateTime createdAt;

  const CommentEntity({
    required this.userId,
    required this.publishId,
    required this.uid,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [userId, uid, publishId, content, createdAt];
}
