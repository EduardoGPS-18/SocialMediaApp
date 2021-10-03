import '../entities/entities.dart';

abstract class RegisterUser {
  Future<UserEntity> registerUserWithRegisterParams({required RegisterUserParams params});
}

class RegisterUserParams {
  final String name;
  final String email;
  final String password;
  final String photoUrl;

  RegisterUserParams({
    required this.name,
    required this.email,
    required this.password,
    required this.photoUrl,
  });
}
