import 'dart:convert';

import '../../domain/entities/entities.dart';

class RemoteUserModel {
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? uid;

  RemoteUserModel({
    this.name,
    this.email,
    this.photoUrl,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'uid': uid,
    };
  }

  factory RemoteUserModel.fromMap(Map<String, dynamic> map) {
    return RemoteUserModel(
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteUserModel.fromJson(String source) => RemoteUserModel.fromMap(json.decode(source));

  UserEntity toEntity() => UserEntity(name: name ?? '', email: email ?? '', photoUrl: photoUrl ?? '', uid: uid ?? '');
}
