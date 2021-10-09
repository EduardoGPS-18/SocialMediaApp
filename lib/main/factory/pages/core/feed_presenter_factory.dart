import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factory.dart';
import '../../usecases/auth/auth.dart';

FeedPresenter makeFeedPresenter() => GetxFeedPresenter(
      getUser: makeLocalGetUserId(),
      loadRecentPublishes: makeLoadRecentPublishes(),
      loadUser: makeLoadUser(),
      loadPublish: makeLoadPublishByID(),
      unlikePublish: makeUnlikePublish(),
      likePublish: makeLikePublish(),
      deletePublish: makeDeletePublish(),
    );
