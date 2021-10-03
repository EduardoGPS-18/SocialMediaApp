import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';

abstract class AuthPagePresenter {
  Stream<bool> get isLogin;
  Future<void> loginUser();
  Future<void> registerUser();
}

class GetxAuthPagePresenter extends GetxController implements AuthPagePresenter {
  LoginUser remoteLoginUser;
  RegisterUser remoteRegisterUser;

  GetxAuthPagePresenter({
    required this.remoteLoginUser,
    required this.remoteRegisterUser,
  });

  Rx<bool> get isLoginStreamController => true.obs;
  @override
  Stream<bool> get isLogin => isLoginStreamController.stream;

  @override
  Future<void> loginUser() async {
    remoteLoginUser.loginUserWithEmailAndPassword(
      params: LoginUserParams(
        email: "",
        password: "",
      ),
    );
  }

  @override
  Future<void> registerUser() async {
    remoteRegisterUser.registerUserWithRegisterParams(
      params: RegisterUserParams(
        name: "",
        email: "",
        password: "",
        photoUrl: "",
      ),
    );
  }
}
