import '../../entities/entities.dart';

abstract class LoginUser {
  Future<UserEntity> loginUserWithEmailAndPassword({required LoginUserParams params});
}

class LoginUserParams {
  final String email;
  final String password;
  LoginUserParams({
    required this.email,
    required this.password,
  });
}
