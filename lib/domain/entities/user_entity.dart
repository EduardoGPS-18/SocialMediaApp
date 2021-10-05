import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String photoUrl;
  final String uid;

  const UserEntity({
    required this.name,
    required this.email,
    required this.uid,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [name, email, photoUrl, uid];
}
