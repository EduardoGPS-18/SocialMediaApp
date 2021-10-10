import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factory.dart';

CorePresenter makeCorePresenter() => GetxCorePresenter(
      remoteLogout: makeLogout(),
      localGetUserId: makeLocalGetUserId(),
      remoteLoadUser: makeLoadUser(),
    );
