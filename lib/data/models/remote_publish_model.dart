import 'dart:convert';

import '../../domain/entities/entities.dart';

import 'remote_comment_model.dart';

class RemotePublishModel {
  final String? id;
  final String? uid;
  final List<RemoteCommentModel>? comments;
  final List<String>? uidOfWhoLikedIt;
  final String? content;
  final DateTime? createdAt;

  RemotePublishModel({
    this.id,
    this.uid,
    this.comments,
    this.uidOfWhoLikedIt,
    this.content,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'comments': comments?.map((x) => x.toMap()).toList(),
      'uidOfWhoLikedIt': uidOfWhoLikedIt,
      'content': content,
      'createdAt': createdAt?.toString(),
    };
  }

  factory RemotePublishModel.fromMap(Map<String, dynamic> map) {
    return RemotePublishModel(
      id: map['id'],
      uid: map['uid'],
      comments: List<RemoteCommentModel>.from(
          map['comments']?.map((x) => RemoteCommentModel.fromMap(x))),
      uidOfWhoLikedIt: List<String>.from(map['uidOfWhoLikedIt']),
      content: map['content'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemotePublishModel.fromJson(String source) =>
      RemotePublishModel.fromMap(json.decode(source));

  PublishEntity toEntity() => PublishEntity(
        id: id ?? '',
        uid: uid ?? '',
        comments: comments?.map((comment) => comment.toEntity()).toList() ??
            <CommentEntity>[],
        createdAt: createdAt ?? DateTime.now(),
        content: content ?? '',
        uidOfWhoLikedIt: uidOfWhoLikedIt ?? <String>[],
      );

  factory RemotePublishModel.fromEntity(PublishEntity entity) =>
      RemotePublishModel(
        id: entity.id,
        uid: entity.uid,
        uidOfWhoLikedIt: entity.uidOfWhoLikedIt,
        createdAt: entity.createdAt,
        content: entity.content,
        comments: entity.comments
            .map(
                (commentEntity) => RemoteCommentModel.fromEntity(commentEntity))
            .toList(),
      );
}
