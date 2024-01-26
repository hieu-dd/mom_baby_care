import 'package:baby_repository/src/models/baby_size.dart';

import 'models/baby.dart';

abstract class BabyApi {
  Stream<Baby> streamBaby(String? token);

  Future<Baby> getBaby(String? token);

  Future<void> saveBaby(String? token, Baby baby);

  Future<void> updateName(String? token, String name);

  Future<void> updateNickname(String? token, String nickName);

  Future<void> updateBirthDay(String? token, DateTime birthDay);

  Future<void> updateDueDate(String? token, DateTime dueDate);

  Future<void> addSize(String? token, BabySize size);

  Future<void> deleteSize(String? token, String id);
}
