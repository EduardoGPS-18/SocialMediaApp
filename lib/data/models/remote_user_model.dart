import '../../domain/entities/entities.dart';

class RemoteUserModel extends UserEntity {
  RemoteUserModel({
    required String name,
    required String photoUrl,
    required String email,
  }) : super(name: name, photoUrl: photoUrl, email: email);

  Map<String, String> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
        "email": email,
      };
  factory RemoteUserModel.fromMap(Map<String, dynamic> map) => RemoteUserModel(
        name: map["name"],
        photoUrl: map["photoUrl"],
        email: map["email"],
      );
  
}
