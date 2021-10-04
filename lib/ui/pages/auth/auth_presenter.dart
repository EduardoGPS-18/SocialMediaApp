abstract class AuthPagePresenter {
  Stream<bool> get isLogin;
  Stream<int> get pageIndex;

  void setPageIndex(int value);

  Future<void> loginUser();
  Future<void> registerUser();
}
