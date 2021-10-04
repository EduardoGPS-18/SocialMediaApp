import 'dart:io';

import 'package:get/get.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';

class GetxAuthPagePresenter extends GetxController implements AuthPagePresenter {
  LoginUser remoteLoginUser;
  RegisterUser remoteRegisterUser;
  GetImage localGetImage;

  String _name = "";
  String _email = "";
  String _password = "";
  File? _userImage;

  GetxAuthPagePresenter({
    required this.remoteLoginUser,
    required this.remoteRegisterUser,
    required this.localGetImage,
  });

  RxBool get isLoginStreamController => true.obs;
  @override
  Stream<bool> get isLogin => isLoginStreamController.stream;

  RxInt pageIndexStreamController = 0.obs;
  @override
  void setPageIndex(int value) => pageIndexStreamController.subject.add(value);
  @override
  Stream<int> get pageIndex => pageIndexStreamController.stream;

  Rx<File?> userImageStreamController = Rx<File?>(null);
  @override
  Stream<File?> get userImage => userImageStreamController.stream;

  @override
  void validateEmail(String email) {
    _email = email;
  }

  @override
  void validatePassword(String password) {
    _password = password;
  }

  @override
  void validateName(String name) {
    _name = name;
  }

  @override
  Future<void> setImage() async {
    File image = await localGetImage.getImage();
    userImageStreamController.subject.add(image);
  }

  @override
  Future<void> loginUser() async {
    try {
      remoteLoginUser.loginUserWithEmailAndPassword(
        params: LoginUserParams(email: _email, password: _password),
      );
    } catch (e) {}
  }

  @override
  Future<void> registerUser() async {
    try {
      remoteRegisterUser.registerUserWithRegisterParams(
        params: RegisterUserParams(name: _name, email: _email, password: _password, photoUrl: ""),
      );
    } catch (err) {}
  }
}
