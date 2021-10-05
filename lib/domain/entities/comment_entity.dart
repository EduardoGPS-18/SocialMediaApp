import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String id;
  final String publishId;
  final String uid;
  final String content;
  final DateTime createdAt;

  const CommentEntity({
    required this.id,
    required this.publishId,
    required this.uid,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, uid, publishId, content, createdAt];
}
