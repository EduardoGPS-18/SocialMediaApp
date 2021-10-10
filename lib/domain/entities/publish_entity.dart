import 'package:equatable/equatable.dart';

class PublishEntity extends Equatable {
  final String userId;
  final String uid;
  final int commentsCount;
  final List<String> uidOfWhoLikedIt;
  final String content;
  final DateTime createdAt;

  const PublishEntity({
    required this.userId,
    required this.uid,
    required this.commentsCount,
    required this.uidOfWhoLikedIt,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [userId, uid, commentsCount, uidOfWhoLikedIt, content, createdAt];
}
