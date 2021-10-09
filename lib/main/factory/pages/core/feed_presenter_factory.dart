import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';

import '../../factory.dart';
import '../../usecases/auth/auth.dart';

FeedPresenter makeFeedPresenter() => GetxFeedPresenter(
    localGetUserId: makeLocalGetUserId(),
    remoteLoadRecentPublishes: makeLoadRecentPublishes(),
    remoteLoadUser: makeLoadUser(),
    remoteLoadPublish: makeLoadPublishByID(),
    remoteUnlikePublish: makeUnlikePublish(),
    remoteLikePublish: makeLikePublish(),
    remoteAddPublish: makeAddPublish(),
    validation: makeCreatePostValidations());
