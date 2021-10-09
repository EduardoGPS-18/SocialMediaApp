import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factory.dart';
import '../../usecases/saver_user_image_factory.dart';
import 'profile_validation_factory.dart';

ProfilePresenter makeProfilePresenter() => GetxProfilePresenter(
      validation: makeProfileValidation(),
      localGetImage: makeSelectLocalImage(),
      localGetUserId: makeLocalGetUserId(),
      remoteGetPublishesByUserID: makeLoadPublishesByUserId(),
      remoteLoadUser: makeLoadUser(),
      remoteSaveUserImage: makeSaveUserImage(),
    );
