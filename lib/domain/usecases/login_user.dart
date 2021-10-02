abstract class LoginUser {
  Future<void> loginUserWithEmailAndPassword({required LoginUserParams params});
}

class LoginUserParams {
  final String email;
  final String password;
  LoginUserParams({
    required this.email,
    required this.password,
  });
}
