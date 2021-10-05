import 'dart:io';

import '../../helpers/helpers.dart';

abstract class AuthPagePresenter {
  Stream<bool> get isFormValid;
  Stream<int> get pageIndex;

  Stream<File?> get userImage;
  Stream<UIError> get userImageError;
  Stream<UIError> get emailError;
  Stream<UIError> get passwordError;
  Stream<UIError> get confirmPasswordError;
  Stream<UIError> get nameError;
  Stream<String> get handlingError;

  void setPageIndex(int value);

  void setImage();
  void validateEmail(String email);
  void validatePassword(String password);
  void validateName(String name);
  void validateConfirmPassword(String confirmPassword);

  Future<void> loginUser();
  Future<void> registerUser();
}
