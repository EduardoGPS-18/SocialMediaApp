import 'package:social_media_app/main/factory/factory.dart';
import 'package:social_media_app/main/factory/pages/core/profile_validation_factory.dart';
import '../../../../presentation/presenters/presenters.dart';

import '../../../../ui/pages/pages.dart';

ProfilePresenter makeProfilePresenter() => GetxProfilePresenter(
    validation: makeProfileValidation(),
    localGetImage: makeSelectLocalImage(),
    localGetUserId: makeLocalGetUserId(),
    remoteGetPublishesByUserID: makeLoadPublishesByUserId(),
    remoteLoadUser: makeLoadUser());
