import '../entities/entities.dart';

abstract class LoadUser {
  Future<UserEntity> loadUserByUID({required String uid});
}
