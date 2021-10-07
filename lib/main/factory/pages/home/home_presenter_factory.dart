import '../../factory.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/home/home.dart';

HomePagePresenter makeHomePagePresenter() => GetxHomePagePresenter(localGetUserId: localGetUserId, remoteAddComment: makeAddComment(), remoteDeleteComment: remoteDeleteComment, remoteAddPublish: makeAddPublish(), remoteDeletePublish: remoteDeletePublish, remoteLikePublish: remoteLikePublish, remoteUnlikePublish: remoteUnlikePublish, remoteLoadPublish: makeLoadPublishByID(), remoteLoadPublishesByUserID: makeLoadPublishesByUserId(), remoteLoadRecentPublishes: remoteLoadRecentPublishes, remoteLoadUser: remoteLoadUser)