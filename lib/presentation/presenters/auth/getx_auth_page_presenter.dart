import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/pages/pages.dart';
import '../../protocols/protocols.dart';

class GetxAuthPagePresenter extends GetxController
    implements AuthPagePresenter {
  LoginUser remoteLoginUser;
  RegisterUser remoteRegisterUser;
  GetImage localGetImage;
  Validation validation;

  String _name = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  File? _userImage;

  GetxAuthPagePresenter({
    required this.remoteLoginUser,
    required this.remoteRegisterUser,
    required this.localGetImage,
    required this.validation,
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
  final Rx<UIError> _userImageErrorStreamController = (UIError.noError).obs;
  @override
  Stream<UIError> get userImageError => _userImageErrorStreamController.stream;

  final Rx<UIError> _emailErrorStreamController = (UIError.noError).obs;
  @override
  Stream<UIError> get emailError => _emailErrorStreamController.stream;

  final Rx<UIError> _passwordErrorStreamController = (UIError.noError).obs;
  @override
  Stream<UIError> get passwordError => _passwordErrorStreamController.stream;

  final Rx<UIError> _confirmPasswordErrorStreamController =
      (UIError.noError).obs;
  @override
  Stream<UIError> get confirmPasswordError =>
      _confirmPasswordErrorStreamController.stream;

  final Rx<UIError> _nameErrorStreamController = (UIError.noError).obs;
  @override
  Stream<UIError> get nameError => _nameErrorStreamController.stream;

  RxBool isFormValidStreamController = false.obs;
  @override
  Stream<bool> get isFormValid => isFormValidStreamController.stream;

  @override
  void validateEmail(String email) {
    _email = email;
    final error = _validateField('email');
    _emailErrorStreamController.subject.add(error);
  }

  @override
  void validatePassword(String password) {
    _password = password;
    final error = _validateField('password');
    _passwordErrorStreamController.subject.add(error);
  }

  @override
  void validateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    final error = _validateField('confirm_password');
    _confirmPasswordErrorStreamController.subject.add(error);
  }

  @override
  void validateName(String name) {
    _name = name;
    final error = _validateField('name');
    _nameErrorStreamController.subject.add(error);
  }

  @override
  Future<void> setImage() async {
    File image = await localGetImage.getImage();
    userImageStreamController.subject.add(image);
    final error = _validateField('image');
    _userImageErrorStreamController.subject.add(error);
  }

  void _validateForm() {
    isFormValidStreamController.subject.add(
      _emailErrorStreamController.value == UIError.noError &&
          _confirmPasswordErrorStreamController.value == UIError.noError &&
          _nameErrorStreamController.value == UIError.noError &&
          _userImageErrorStreamController.value == UIError.noError &&
          _passwordErrorStreamController.value == UIError.noError &&
          _email != '' &&
          _password != '',
    );
  }

  UIError _validateField(String field) {
    final formData = {
      'confirm_password': _confirmPassword,
      'name': _name,
      'image': _userImage,
      'email': _email,
      'password': _password,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      case ValidationError.noError:
        return UIError.noError;
    }
  }

  @override
  Future<void> loginUser() async {
    try {
      remoteLoginUser.loginUserWithEmailAndPassword(
        params: LoginUserParams(email: _email, password: _password),
      );
    } catch (error) {
      debugPrint('$error');
    }
  }

  @override
  Future<void> registerUser() async {
    try {
      remoteRegisterUser.registerUserWithRegisterParams(
        params: RegisterUserParams(
            name: _name, email: _email, password: _password, photoUrl: ""),
      );
    } catch (error) {
      debugPrint('$error');
    }
  }
}
