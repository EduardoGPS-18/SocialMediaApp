import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String photoUrl;

  const UserEntity({
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [name, email, photoUrl];
}
