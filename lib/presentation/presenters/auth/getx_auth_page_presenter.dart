import 'dart:io';

import 'package:get/get.dart';

import '../../../data/firebase/firebase.dart';
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

  final RxInt pageIndexStreamController = 0.obs;
  bool isLogin = true;
  @override
  void setPageIndex(int value) {
    pageIndexStreamController.subject.add(value);
    isLogin = value == 0;
  }

  Rx<String> handlingErrorsStreamController = Rx<String>("");
  @override
  Stream<String> get handlingError => handlingErrorsStreamController.stream;

  @override
  Stream<int> get pageIndex => pageIndexStreamController.stream;

  Rx<File?> userImageStreamController = Rx<File?>(null);
  @override
  Stream<File?> get userImage => userImageStreamController.stream;
  final Rx<UIError> _userImageErrorStreamController = (UIError.unexpected).obs;
  @override
  Stream<UIError> get userImageError => _userImageErrorStreamController.stream;

  final Rx<UIError> _emailErrorStreamController = (UIError.unexpected).obs;
  @override
  Stream<UIError> get emailError => _emailErrorStreamController.stream;

  final Rx<UIError> _passwordErrorStreamController = (UIError.unexpected).obs;
  @override
  Stream<UIError> get passwordError => _passwordErrorStreamController.stream;

  final Rx<UIError> _confirmPasswordErrorStreamController =
      (UIError.unexpected).obs;
  @override
  Stream<UIError> get confirmPasswordError =>
      _confirmPasswordErrorStreamController.stream;

  final Rx<UIError> _nameErrorStreamController = (UIError.unexpected).obs;
  @override
  Stream<UIError> get nameError => _nameErrorStreamController.stream;

  RxBool isFormValidStreamController = false.obs;
  @override
  Stream<bool> get isFormValid => isFormValidStreamController.stream;

  @override
  void validateEmail(String email) {
    _email = email;
    _emailErrorStreamController.value = _validateField('email');
    _validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;

    _passwordErrorStreamController.value = _validateField('password');
    _confirmPasswordErrorStreamController.value =
        _validateField('confirm_password');
    _validateForm();
  }

  @override
  void validateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    _confirmPasswordErrorStreamController.value =
        _validateField('confirm_password');
    _validateForm();
  }

  @override
  void validateName(String name) {
    _name = name;
    _nameErrorStreamController.value = _validateField('name');
    _validateForm();
  }

  @override
  Future<void> setImage() async {
    File? image = await localGetImage.getImage();
    _userImage = image;
    userImageStreamController.subject.add(image);
    _userImageErrorStreamController.value = _validateField('image');
    _validateForm();
  }

  void _validateForm() {
    final isValid = !isLogin
        ? _emailErrorStreamController.value == UIError.noError &&
            _confirmPasswordErrorStreamController.value == UIError.noError &&
            _nameErrorStreamController.value == UIError.noError &&
            _userImageErrorStreamController.value == UIError.noError &&
            _passwordErrorStreamController.value == UIError.noError &&
            _email != '' &&
            _password != ''
        : _emailErrorStreamController.value == UIError.noError &&
            _passwordErrorStreamController.value == UIError.noError &&
            _email != '' &&
            _password != '';

    isFormValidStreamController.subject.add(isValid);
  }

  UIError _validateField(String field) {
    final formData = {
      'confirm_password': _confirmPassword,
      'name': _name,
      'image': _userImage?.path,
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
      await remoteLoginUser.loginUserWithEmailAndPassword(
        params: LoginUserParams(email: _email, password: _password),
      );
    } on FirebaseAuthenticationError catch (_) {
      handlingErrorsStreamController.subject
          .add(R.string.msgInvalidCredentials);
    } catch (_) {
      handlingErrorsStreamController.subject
          .add("Ocorreu um erro!\nPreencha todos os dados incluindo a foto!");
    }
  }

  @override
  Future<bool> registerUser() async {
    try {
      await remoteRegisterUser.registerUserWithRegisterParams(
        params: RegisterUserParams(
          name: _name,
          email: _email,
          password: _password,
          userImage: _userImage!,
        ),
      );
      return true;
    } on FirebaseAuthenticationError catch (error) {
      if (error.code == FirebaseAuthenticationError.emailAlreadyInUse.code) {
        handlingErrorsStreamController.subject.add(R.string.msgEmailInUse);
      } else if (error.code == FirebaseAuthenticationError.weakPassword.code) {
        handlingErrorsStreamController.subject.add(R.string.msgWeakPassword);
      } else {
        handlingErrorsStreamController.subject.add(R.string.msgUnexpectedError);
      }
      return false;
    } catch (_) {
      handlingErrorsStreamController.subject
          .add("Ocorreu um erro!\nPreencha todos os dados incluindo a foto!");
      return false;
    }
  }
}
