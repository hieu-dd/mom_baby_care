import 'dart:convert';

import 'package:baby_repository/src/baby_api.dart';
import 'package:baby_repository/src/models/baby.dart';
import 'package:baby_repository/src/models/baby_size.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalBabyApi extends BabyApi {
  LocalBabyApi({required SharedPreferences preferences})
      : _sharedPreferences = preferences {
    _babyStreamController.sink.add(getBaby());
  }

  final _babyStreamController = BehaviorSubject<Baby>();
  final SharedPreferences _sharedPreferences;

  @override
  Stream<Baby> streamBaby() => _babyStreamController.stream;

  @override
  Future<void> saveBaby(Baby baby) async {
    _babyStreamController.sink.add(baby);
    await _saveBabyToSharedPreference(baby);
  }

  @override
  Future<void> updateBirthDay(DateTime birthDay) async {
    final newBaby = getBaby().copyWith(newBirthDay: birthDay);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> updateName(String name) async {
    final newBaby = getBaby().copyWith(newName: name);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> updateNickname(String nickName) async {
    final newBaby = getBaby().copyWith(newNickname: nickName);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> addSize(BabySize size) async {
    final newBaby = getBaby().copyWith(newSizes: [size]);
    await _saveBabyToSharedPreference(newBaby);
  }

  Future<void> _saveBabyToSharedPreference(Baby baby) async {
    try {
      String babyJson = json.encode(baby.toJson());
      await _sharedPreferences.setString(_babyKey, babyJson);
      _babyStreamController.sink.add(baby);
    } catch (e) {
      print("Save error $e");
    }
  }

  @override
  Baby getBaby() {
    try {
      return _babyStreamController.stream.value;
    } catch (_) {
      try {
        final babyJson = jsonDecode(_sharedPreferences.getString(_babyKey)!);
        return Baby.fromJson(babyJson);
      } catch (_) {
        return Baby.empty();
      }
    }
  }

  static const String _babyKey = 'baby';
}
