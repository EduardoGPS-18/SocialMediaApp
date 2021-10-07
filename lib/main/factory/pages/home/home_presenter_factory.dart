import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/home/home.dart';
import '../../factory.dart';

HomePagePresenter makeHomePagePresenter() => GetxHomePagePresenter(
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
