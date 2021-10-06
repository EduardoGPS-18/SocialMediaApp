import '../../../entities/entities.dart';

abstract class LoadPublish {
  Future<PublishEntity> findPublishById({required String publishId});
}
