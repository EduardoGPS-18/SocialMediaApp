import '../../../entities/entities.dart';

abstract class LoadPublishesByUserID {
  Stream<List<PublishEntity>> getPublishesByUserID({required String userId});
}
