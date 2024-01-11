#!/bin/bash
flutter pub run build_runner build

cd packages/authentication_repository || exit
flutter pub run build_runner build
cd - || exit

cd packages/baby_repository || exit
flutter pub run build_runner build
cd - || exit