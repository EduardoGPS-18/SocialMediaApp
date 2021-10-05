import 'dart:convert';

import '../../domain/entities/entities.dart';

class RemoteCommentModel {
  final String? id;
  final String? uid;
  final String? publishId;
  final String? content;
  final DateTime? createdAt;

  RemoteCommentModel({
    this.id,
    this.uid,
    this.publishId,
    this.content,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'publishId': publishId,
      'content': content,
      'createdAt': createdAt?.toString(),
    };
  }

  factory RemoteCommentModel.fromMap(Map<String, dynamic> map) {
    return RemoteCommentModel(
      id: map['id'],
      uid: map['uid'],
      publishId: map['publishId'],
      content: map['content'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteCommentModel.fromJson(String source) =>
      RemoteCommentModel.fromMap(json.decode(source));

  CommentEntity toEntity() => CommentEntity(
        id: id ?? '',
        uid: uid ?? '',
        publishId: publishId ?? '',
        createdAt: createdAt ?? DateTime.parse('00010101'),
        content: content ?? '',
      );

  factory RemoteCommentModel.fromEntity(CommentEntity entity) =>
      RemoteCommentModel(
        id: entity.id,
        uid: entity.uid,
        publishId: entity.publishId,
        content: entity.content,
        createdAt: entity.createdAt,
      );
}
