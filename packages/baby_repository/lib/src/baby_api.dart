import 'package:baby_repository/src/models/baby_size.dart';

import 'models/baby.dart';

abstract class BabyApi {
  Stream<Baby> streamBaby();

  Future<Baby> getBaby();

  Future<void> saveBaby(Baby baby);

  Future<void> updateName(String name);

  Future<void> updateNickname(String nickName);

  Future<void> updateBirthDay(DateTime birthDay);

  Future<void> addSize(BabySize size);

  Future<void> deleteSize(String id);
}
