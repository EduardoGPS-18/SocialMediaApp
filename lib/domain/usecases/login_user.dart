abstract class LoginUser {
  Future<void> loadUser({required LoginUserParams params});
}

class LoginUserParams {
  final String email;
  final String password;
  LoginUserParams({
    required this.email,
    required this.password,
  });
}
