import '../../../../../../../presentation/presenters/home/page_viewer/page_view_presenters/central_app_page_presenter.dart';
import '../../../../../../../ui/pages/home/page_viewer/page_view_pages/feed/feed.dart';
import '../../../../../factory.dart';
import '../../../../../usecases/auth/auth.dart';

FeedPresenter makeFeedPresenter() => GetxFeedPresenter(
      getUser: makeLocalGetUserId(),
      loadRecentPublishes: makeLoadRecentPublishes(),
      loadUser: makeLoadUser(),
      loadPublish: makeLoadPublishByID(),
      unlikePublish: makeUnlikePublish(),
      likePublish: makeLikePublish(),
    );
