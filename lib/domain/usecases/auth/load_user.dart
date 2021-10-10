import '../../entities/entities.dart';

abstract class LoadUser {
  Stream<UserEntity> loadUserByUID({required String uid});
}
