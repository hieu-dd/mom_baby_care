import 'package:baby_repository/src/baby_api.dart';
import 'package:baby_repository/src/models/baby_size.dart';

import 'models/baby.dart';

class BabyRepository {
  BabyRepository({required BabyApi babyApi}) : _babyApi = babyApi;
  final BabyApi _babyApi;

  Future<Baby> getBaby({String? token}) => _babyApi.getBaby(token);

  Stream<Baby> streamBaby({String? token}) => _babyApi.streamBaby(token);

  Future<void> saveBaby(Baby baby, {String? token}) =>
      _babyApi.saveBaby(token, baby);

  Future<void> updateName(String name, {String? token}) =>
      _babyApi.updateName(token, name);

  Future<void> updateNickname(String nickName, {String? token}) =>
      _babyApi.updateNickname(token, nickName);

  Future<void> updateBirthDay(DateTime birthDay, {String? token}) =>
      _babyApi.updateBirthDay(token, birthDay);

  Future<void> addSize(BabySize size, {String? token}) =>
      _babyApi.addSize(token, size);

  Future<void> deleteSize(String id, {String? token}) =>
      _babyApi.deleteSize(token, id);
}
