import '../../domain/entities/entities.dart';

class RemoteSaveUserModel extends UserEntity {
  RemoteSaveUserModel({
    required String name,
    required String photoUrl,
    required String email,
  }) : super(name: name, photoUrl: photoUrl, email: email);

  Map<String, String> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
        "email": email,
      };
}
