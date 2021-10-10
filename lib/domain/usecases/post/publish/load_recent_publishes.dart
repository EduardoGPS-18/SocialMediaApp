import '../../../entities/entities.dart';

abstract class LoadRecentPublishes {
  Stream<List<PublishEntity>> getPublishesByDate({required DateTime date});
}
