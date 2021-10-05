import '../../entities/entities.dart';

abstract class LoadPublishesByUID {
  Future<List<PublishEntity>> getPublishesByUID({required String userId});
}
