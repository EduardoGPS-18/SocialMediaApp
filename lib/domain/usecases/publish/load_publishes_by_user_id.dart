import '../../entities/entities.dart';

abstract class LoadPublishesByUserID {
  Future<List<PublishEntity>> getPublishesByUserID({required String userId});
}
