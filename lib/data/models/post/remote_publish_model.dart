import 'dart:convert';

import '../../../domain/entities/entities.dart';

class RemotePublishModel {
  final String? userId;
  final String? uid;
  final int? commentsCount;
  final List<String>? uidOfWhoLikedIt;
  final String? content;
  final DateTime? createdAt;

  RemotePublishModel({
    this.userId,
    this.uid,
    this.commentsCount,
    this.uidOfWhoLikedIt,
    this.content,
    this.createdAt,
  });

  factory RemotePublishModel.toSave({required String content, required String userId}) {
    return RemotePublishModel(commentsCount: 0, content: content, createdAt: DateTime.now(), uidOfWhoLikedIt: [], uid: '', userId: userId);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'uid': uid,
      'commentsCount': commentsCount,
      'uidOfWhoLikedIt': uidOfWhoLikedIt,
      'content': content,
      'createdAt': createdAt?.toString(),
    };
  }

  factory RemotePublishModel.fromMap(Map<String, dynamic> map) {
    return RemotePublishModel(
      userId: map['userId'],
      uid: map['uid'],
      commentsCount: map['commentsCount'],
      uidOfWhoLikedIt: map['uidOfWhoLikedIt'] != null ? List<String>.from(map['uidOfWhoLikedIt']) : [],
      content: map['content'],
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RemotePublishModel.fromJson(String source) => RemotePublishModel.fromMap(json.decode(source));

  PublishEntity toEntity() => PublishEntity(
        userId: userId ?? '',
        uid: uid ?? '',
        commentsCount: commentsCount ?? 0,
        createdAt: createdAt ?? DateTime.now(),
        content: content ?? '',
        uidOfWhoLikedIt: uidOfWhoLikedIt ?? <String>[],
      );

  factory RemotePublishModel.fromEntity(PublishEntity entity) => RemotePublishModel(
        userId: entity.userId,
        uid: entity.uid,
        uidOfWhoLikedIt: entity.uidOfWhoLikedIt,
        createdAt: entity.createdAt,
        content: entity.content,
        commentsCount: entity.commentsCount,
      );
}
