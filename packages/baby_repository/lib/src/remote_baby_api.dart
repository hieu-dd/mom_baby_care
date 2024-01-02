import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:intl/intl.dart';

import 'baby_api.dart';
import 'models/baby.dart';
import 'models/baby_size.dart';

class RemoteBabyApi extends BabyApi {
  RemoteBabyApi({
    cloud_firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? cloud_firestore.FirebaseFirestore.instance;

  final cloud_firestore.FirebaseFirestore _firebaseFirestore;
  String? _token;

  @override
  Future<void> addSize(String? token, BabySize size) async {
    _checkLogin(token);
    await _firebaseFirestore.collection('babies').doc(_token).update({
      'sizes': cloud_firestore.FieldValue.arrayUnion([size.toJson()]),
    });
  }

  @override
  Future<void> deleteSize(String? token, String sizeId) async {
    _checkLogin(token);
    final currentBaby = await getBaby(_token);
    final deleteSize =
        currentBaby.sizes.firstWhere((element) => element.id == sizeId);
    await _firebaseFirestore.collection('babies').doc(_token).update({
      'sizes': cloud_firestore.FieldValue.arrayRemove([deleteSize.toJson()]),
    });
  }

  @override
  Future<Baby> getBaby(String? token) async {
    _checkLogin(token);
    final snapshot =
        await _firebaseFirestore.collection('babies').doc(_token).get();
    return _babyFromDocumentSnapshot(snapshot);
  }

  @override
  Future<void> saveBaby(String? token, Baby baby) async {
    _checkLogin(token);
    await _firebaseFirestore
        .collection('babies')
        .doc(_token)
        .update(baby.toJson());
  }

  @override
  Stream<Baby> streamBaby(
    String? token,
  ) {
    _checkLogin(token);
    return _firebaseFirestore
        .collection('babies')
        .doc(_token)
        .snapshots()
        .map((snapshot) => _babyFromDocumentSnapshot(snapshot));
  }

  @override
  Future<void> updateBirthDay(String? token, DateTime birthDay) async {
    _checkLogin(token);
    await _firebaseFirestore
        .collection('babies')
        .doc(_token)
        .update({'birthDay': DateFormat('yyyy-MM-dd').format(birthDay)});
  }

  @override
  Future<void> updateName(String? token, String name) async {
    _checkLogin(token);
    await _firebaseFirestore
        .collection('babies')
        .doc(_token)
        .update({'name': name});
  }

  @override
  Future<void> updateNickname(String? token, String nickName) async {
    _checkLogin(token);
    await _firebaseFirestore.collection('babies').doc(_token).update(
      {'nickname': nickName},
    );
  }

  Baby _babyFromDocumentSnapshot(
      cloud_firestore.DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.exists ? Baby.fromJson(snapshot.data()!) : Baby.empty;
  }

  void _checkLogin(String? token) {
    _token = token ?? _token;
    if (_token == null) throw Exception('User don\'t login before');
  }
}
