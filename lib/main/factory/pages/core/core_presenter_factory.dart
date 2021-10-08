import '../../../../ui/pages/pages.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../factory.dart';

CorePresenter makeCorePresenter() => GetxCorePresenter(
      localGetUserId: makeLocalGetUserId(),
      remoteAddComment: makeAddComment(),
      remoteDeleteComment: makeDeleteComment(),
      remoteAddPublish: makeAddPublish(),
      remoteDeletePublish: makeDeletePublish(),
      remoteLikePublish: makeLikePublish(),
      remoteUnlikePublish: makeUnlikePublish(),
      remoteLoadPublish: makeLoadPublishByID(),
      remoteLoadPublishesByUserID: makeLoadPublishesByUserId(),
      remoteLoadRecentPublishes: makeLoadRecentPublishes(),
      remoteLoadUser: makeLoadUser(),
    );
