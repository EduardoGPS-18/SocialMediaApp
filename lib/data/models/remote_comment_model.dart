import 'dart:convert';

import '../../domain/entities/entities.dart';

class RemoteCommentModel {
  final String? userId;
  String? uid;
  final String? publishId;
  final String? content;
  final DateTime? createdAt;

  RemoteCommentModel setUid(String v) {
    uid = v;
    return this;
  }

  RemoteCommentModel({
    this.userId,
    this.uid,
    this.publishId,
    this.content,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'uid': uid,
      'publishId': publishId,
      'content': content,
      'createdAt': createdAt?.toString(),
    };
  }

  factory RemoteCommentModel.fromMap(Map<String, dynamic> map) {
    return RemoteCommentModel(
      userId: map['userId'],
      uid: map['uid'],
      publishId: map['publishId'],
      content: map['content'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteCommentModel.fromJson(String source) => RemoteCommentModel.fromMap(json.decode(source));

  CommentEntity toEntity() => CommentEntity(
        userId: userId ?? '',
        uid: uid ?? '',
        publishId: publishId ?? '',
        createdAt: createdAt ?? DateTime.parse('00010101'),
        content: content ?? '',
      );

  factory RemoteCommentModel.fromEntity(CommentEntity entity) => RemoteCommentModel(
        userId: entity.userId,
        uid: entity.uid,
        publishId: entity.publishId,
        content: entity.content,
        createdAt: entity.createdAt,
      );
}
