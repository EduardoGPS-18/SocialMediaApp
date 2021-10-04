import 'dart:io';

abstract class AuthPagePresenter {
  Stream<bool> get isLogin;
  Stream<int> get pageIndex;
  Stream<File?> get userImage;

  void setPageIndex(int value);

  void setImage();
  void validateEmail(String email);
  void validatePassword(String password);
  void validateName(String name);

  Future<void> loginUser();
  Future<void> registerUser();
}
