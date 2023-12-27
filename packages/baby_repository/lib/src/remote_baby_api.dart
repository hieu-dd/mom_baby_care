import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../baby_repository.dart';
import 'baby_api.dart';

class RemoteBabyApi extends BabyApi {
  RemoteBabyApi({
    FirebaseFirestore? firebaseFirestore,
    required String userId,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _userId = userId;

  final FirebaseFirestore _firebaseFirestore;
  final String _userId;

  @override
  Future<void> addSize(BabySize size) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('babies')
        .doc(size.id)
        .set(size.toJson(), SetOptions(merge: true));
  }

  @override
  Future<void> deleteSize(String sizeId) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('baby_sizes')
        .doc(sizeId)
        .delete();
  }

  @override
  Future<Baby> getBaby() async {
    final snapshot = await _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('babies')
        .get();
    return snapshot.docs
        .map((doc) => Baby.fromJson(doc.data()))
        .first;
  }

  @override
  Future<void> saveBaby(Baby baby) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('babies')
        .doc(baby.id)
        .set(baby.toJson());
  }

  @override
  Stream<Baby> streamBaby() {
    return _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('babies')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Baby.fromJson(doc.data()))
          .first;
    });
  }

  @override
  Future<void> updateBirthDay(DateTime birthDay) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('babies')
        .doc('unique_baby_id') // Replace with actual baby ID
        .update({'birthDay': DateFormat('yyyy-MM-dd').format(birthDay)});
  }

  @override
  Future<void> updateName(String name) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('babies')
        .doc('unique_baby_id') // Replace with actual baby ID
        .update({'name': name});
  }

  @override
  Future<void> updateNickname(String nickName) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_userId)
        .collection('babies')
        .doc('unique_baby_id') // Replace with actual baby ID
        .update(
      {'nickname': nickName},
    );
  }
}
