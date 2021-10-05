import '../../entities/entities.dart';

abstract class AddPublish {
  Future<void> addPublish({required PublishEntity publish});
}
