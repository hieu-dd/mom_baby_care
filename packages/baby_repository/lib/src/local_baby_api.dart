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
  Stream<Baby> streamBaby() => _babyStreamController.stream;

  @override
  Future<void> saveBaby(Baby baby) async {
    _babyStreamController.sink.add(baby);
    await _saveBabyToSharedPreference(baby);
  }

  @override
  Future<void> updateBirthDay(DateTime birthDay) async {
    final newBaby =
        _getBaby(_sharedPreferences).copyWith(newBirthDay: birthDay);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> updateName(String name) async {
    final newBaby = _getBaby(_sharedPreferences)..copyWith(newName: name);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> updateNickname(String nickName) async {
    final newBaby =
        _getBaby(_sharedPreferences).copyWith(newNickname: nickName);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> addSize(BabySize size) async {
    final newBaby = _getBaby(_sharedPreferences).copyWith(addSizes: [size]);
    await _saveBabyToSharedPreference(newBaby);
  }

  @override
  Future<void> deleteSize(String id) async {
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
  Future<Baby> getBaby() async {
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
        return Baby.empty();
      }
    }
  }

  static const String _babyKey = 'baby';
}
