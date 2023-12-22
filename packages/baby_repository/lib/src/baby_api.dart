import 'models/baby.dart';

abstract class BabyApi {
  Stream<Baby> getBaby();

  Future<void> saveBaby(Baby baby);

  Future<void> updateName(String name);

  Future<void> updateNickname(String nickName);

  Future<void> updateBirthDay(DateTime birthDay);
}
