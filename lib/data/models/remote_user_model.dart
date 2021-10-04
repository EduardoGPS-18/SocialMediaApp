import 'dart:convert';

import '../../domain/entities/entities.dart';

class RemoteUserModel {
  final String? name;
  final String? email;
  final String? photoUrl;

  RemoteUserModel({
    this.name,
    this.email,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory RemoteUserModel.fromMap(Map<String, dynamic> map) {
    return RemoteUserModel(
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteUserModel.fromJson(String source) =>
      RemoteUserModel.fromMap(json.decode(source));

  UserEntity toEntity() => UserEntity(
      name: name ?? '', email: email ?? '', photoUrl: photoUrl ?? '');
}
