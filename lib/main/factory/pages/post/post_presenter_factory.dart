import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factory.dart';
import 'post.dart';

PostPresenter makePostPresenter() => GetxPostPresenter(
      remoteLoadUser: makeLoadUser(),
      localGetUserId: makeLocalGetUserId(),
      remoteLoadPublish: makeLoadPublishByID(),
      remoteAddComment: makeAddComment(),
      remoteLoadComments: makeLoadComments(),
      remoteLikePublish: makeLikePublish(),
      remoteUnlikePublish: makeUnlikePublish(),
      validation: makePostValidation(),
      remoteDeleteComment: makeDeleteComment(),
    );
