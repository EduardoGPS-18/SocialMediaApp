import 'package:get/get.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';

class GetxAuthPagePresenter extends GetxController implements AuthPagePresenter {
  LoginUser remoteLoginUser;
  RegisterUser remoteRegisterUser;

  GetxAuthPagePresenter({
    required this.remoteLoginUser,
    required this.remoteRegisterUser,
  });

  RxBool get isLoginStreamController => true.obs;
  @override
  Stream<bool> get isLogin => isLoginStreamController.stream;

  RxInt pageIndexStreamController = 0.obs;
  @override
  void setPageIndex(int value) => pageIndexStreamController.subject.add(value);
  @override
  Stream<int> get pageIndex => pageIndexStreamController.stream;

  @override
  Future<void> loginUser() async {
    try {
      remoteLoginUser.loginUserWithEmailAndPassword(
        params: LoginUserParams(
          email: "",
          password: "",
        ),
      );
    } catch (e) {}
  }

  @override
  Future<void> registerUser() async {
    try {
      remoteRegisterUser.registerUserWithRegisterParams(
        params: RegisterUserParams(
          name: "",
          email: "",
          password: "",
          photoUrl: "",
        ),
      );
    } catch (err) {}
  }
}
