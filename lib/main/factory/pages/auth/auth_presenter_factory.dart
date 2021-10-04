import '../../../../presentation/presenters/auth/auth.dart';
import '../../../../ui/pages/pages.dart';
import '../../factory.dart';

AuthPagePresenter makeAuthPagePresenter() => GetxAuthPagePresenter(
      remoteLoginUser: makeLoginUser(),
      remoteRegisterUser: makeRegisterUser(),
      localGetImage: makeSelectLocalImage(), 
    );
