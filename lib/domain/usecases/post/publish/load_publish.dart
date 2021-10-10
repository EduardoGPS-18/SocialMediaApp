import '../../../entities/entities.dart';

abstract class LoadPublish {
  Stream<PublishEntity> findPublishById({required String publishId});
}
