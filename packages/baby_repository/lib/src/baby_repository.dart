import 'package:baby_repository/src/baby_api.dart';

import 'models/baby.dart';

class BabyRepository {
  BabyRepository({required BabyApi babyApi}) : _babyApi = babyApi;
  final BabyApi _babyApi;

  Stream<Baby> getBaby() => _babyApi.getBaby();

  Future<void> saveBaby(Baby baby) => _babyApi.saveBaby(baby);

  Future<void> updateName(String name) => _babyApi.updateName(name);

  Future<void> updateNickname(String nickName) =>
      _babyApi.updateNickname(nickName);

  Future<void> updateBirthDay(DateTime birthDay) =>
      _babyApi.updateBirthDay(birthDay);
}