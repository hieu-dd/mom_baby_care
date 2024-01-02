import 'dart:convert';

import 'package:baby_repository/src/baby_api.dart';
import 'package:baby_repository/src/models/baby.dart';
import 'package:baby_repository/src/models/baby_size.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalBabyApi extends BabyApi {
  LocalBabyApi({required SharedPreferences preferences})
      : _sharedPreferences = preferences {
    _babyStreamController.sink.add(_getBaby(preferences));
  }

  final _babyStreamController = BehaviorSubject<Baby>();
  final SharedPreferences _sharedPreferences;

  @override
  Stream<Baby> streamBaby(String? token) => _babyStreamController.stream;

  @override
  Future<void> saveBaby(String? token, Baby baby) async {
    _babyStreamController.sink.add(baby);
    await _saveBabyToSharedPreference(baby);
  }

  @override
  Future<void> updateBirthDay(String? token, DateTime birthDay) async {
    final newBaby = _getBaby(_sharedPreferences).copyWith(birthday: birthDay);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> updateName(String? token, String name) async {
    final newBaby = _getBaby(_sharedPreferences)..copyWith(name: name);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> updateNickname(String? token, String nickName) async {
    final newBaby = _getBaby(_sharedPreferences).copyWith(nickname: nickName);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> addSize(String? token, BabySize size) async {
    final newBaby = _getBaby(_sharedPreferences).copyWith(addSizes: [size]);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> deleteSize(String? token, String id) async {
    final currentBaby = _getBaby(_sharedPreferences);
    final newSizes = [...currentBaby.sizes]
      ..removeWhere((element) => element.id == id);
    final newBaby = currentBaby.copyWith(sizes: newSizes);
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
  Future<Baby> getBaby(
    String? token,
  ) async {
    return _getBaby(_sharedPreferences);
  }

  Baby _getBaby(SharedPreferences sharedPreferences) {
    try {
      return _babyStreamController.stream.value;
    } catch (e) {
      try {
        final babyJson = jsonDecode(sharedPreferences.getString(_babyKey)!);
        return Baby.fromJson(babyJson);
      } catch (e) {
        return Baby.empty;
      }
    }
  }

  static const String _babyKey = 'baby';
}
