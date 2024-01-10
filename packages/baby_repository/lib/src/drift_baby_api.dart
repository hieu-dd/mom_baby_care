import 'package:baby_repository/src/baby_api.dart';
import 'package:baby_repository/src/db/baby_db.dart' as db;
import 'package:baby_repository/src/models/baby.dart';
import 'package:baby_repository/src/models/baby_size.dart';
import 'package:baby_repository/src/utils/baby_ext.dart';
import 'package:drift/drift.dart';

class DriftBabyApi extends BabyApi {
  DriftBabyApi({required db.BabiesDatabase babiesDatabase})
      : _babiesDatabase = babiesDatabase;
  final db.BabiesDatabase _babiesDatabase;

  @override
  Future<void> addSize(String? token, BabySize size) async {}

  @override
  Future<void> deleteSize(String? token, String id) async {}

  @override
  Future<Baby> getBaby(String? token) async {
    final savedBaby =
        (await _babiesDatabase.getAllBabies()).firstOrNull?.toDomainModel();
    return savedBaby ?? Baby.empty;
  }

  @override
  Future<void> saveBaby(String? token, Baby baby) async {
    final currentBaby = (await _babiesDatabase.getAllBabies()).firstOrNull;
    await _babiesDatabase.upsert(db.BabiesCompanion(
      id: Value(currentBaby?.id ?? 1),
      name: Value(baby.name),
      nickname: Value(baby.nickname ?? ''),
      birthday: Value(baby.birthday),
      gender: Value(baby.gender.name),
    ));
  }

  @override
  Stream<Baby> streamBaby(String? token) {
    return _babiesDatabase.select(_babiesDatabase.babies).watch().map(
      (List<db.Baby> babyDataList) {
        return babyDataList.firstOrNull?.toDomainModel() ?? Baby.empty;
      },
    );
  }

  @override
  Future<void> updateBirthDay(String? token, DateTime birthDay) async {
    final baby = (await _babiesDatabase.getAllBabies()).firstOrNull;
    if (baby != null) {
      await _babiesDatabase.updateBaby(db.BabiesCompanion(
        id: Value(baby.id),
        birthday: Value(birthDay),
      ));
    }
  }

  @override
  Future<void> updateName(String? token, String name) async {
    final baby = (await _babiesDatabase.getAllBabies()).firstOrNull;
    if (baby != null) {
      await _babiesDatabase.updateBaby(db.BabiesCompanion(
        id: Value(baby.id),
        name: Value(name),
      ));
    }
  }

  @override
  Future<void> updateNickname(String? token, String nickName) async {
    final baby = (await _babiesDatabase.getAllBabies()).firstOrNull;
    if (baby != null) {
      final result = await _babiesDatabase.updateBaby(db.BabiesCompanion(
        id: Value(baby.id),
        nickname: Value(nickName),
      ));
      print("Update nickname $nickName: $result");
    }
  }
}
