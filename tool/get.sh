#!/bin/bash
flutter pub get

cd packages/authentication_repository || exit
flutter pub get
cd - || exit

cd packages/baby_repository || exit
flutter pub get
cd - || exit