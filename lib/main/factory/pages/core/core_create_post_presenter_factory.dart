import 'package:social_media_app/main/factory/factory.dart';
import 'package:social_media_app/presentation/presenters/core/core.dart';

import '../../../../ui/pages/pages.dart';

CreatePostPresenter makeCreatePostPresenter() => GetxCreatePostPresenter(
  localGetUserId: makeLocalGetUserId(),
  remoteAddPublish: makeAddPublish(),
  remoteLoadUser: makeLoadUser(),
  validation: makeCreatePostValidations()
);
