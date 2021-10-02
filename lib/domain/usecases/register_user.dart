abstract class RegisterUser {
  Future<void> registerUserWithRegisterParams({required RegisterUserParams params});
}

class RegisterUserParams {
  final String name;
  final String email;
  final String password;
  final String image;

  RegisterUserParams({
    required this.name,
    required this.email,
    required this.password,
    required this.image,
  });
}
