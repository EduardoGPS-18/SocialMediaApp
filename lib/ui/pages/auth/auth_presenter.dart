abstract class AuthPagePresenter {
  Stream<bool> get isLogin;
  Stream<int> get pageIndex;

  void setPageIndex(int value);

  void validateEmail(String email);
  void validatePassword(String password);
  void validateName(String name);

  Future<void> loginUser();
  Future<void> registerUser();
}
