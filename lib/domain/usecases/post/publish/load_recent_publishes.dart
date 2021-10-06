import '../../../entities/entities.dart';

abstract class LoadRecentPublishes {
  Future<List<PublishEntity>> getPublishesByDate({required DateTime date});
}
