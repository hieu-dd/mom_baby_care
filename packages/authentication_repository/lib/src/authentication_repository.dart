import 'package:authentication_repository/src/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthenticationRepository {
  AuthenticationRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser();
    });
  }

  Future<void> loginWithUserAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      print("Error $e");
    } catch (e) {
      print("Error $e");
    }
  }

  Future<void> logout() async {
    _firebaseAuth.signOut();
  }
}

extension FirebaseExt on firebase_auth.User {
  User toUser() {
    return User(
      id: this.uid,
      name: this.displayName,
      email: this.email,
      photo: this.photoURL,
    );
  }
}
