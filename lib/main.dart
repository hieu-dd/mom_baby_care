import 'package:authentication_repository/authentication_repository.dart';
import 'package:baby_repository/baby_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final babyRepository = BabyRepository(
    babyApi: LocalBabyApi(
      preferences: await SharedPreferences.getInstance(),
    ),
  );
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(
    authenticationRepository: authenticationRepository,
    babyRepository: babyRepository,
  ));
}
