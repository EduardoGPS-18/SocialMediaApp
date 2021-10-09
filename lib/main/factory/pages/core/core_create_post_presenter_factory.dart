import '../../factory.dart';
import '../../../../presentation/presenters/core/core.dart';

import '../../../../ui/pages/pages.dart';

CreatePostPresenter makeCreatePostPresenter() => GetxCreatePostPresenter(
    localGetUserId: makeLocalGetUserId(),
    remoteAddPublish: makeAddPublish(),
    remoteLoadUser: makeLoadUser(),
    validation: makeCreatePostValidations());
