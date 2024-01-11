#!/bin/bash
flutter clean

cd packages/authentication_repository || exit
flutter clean
cd - || exit

cd packages/baby_repository || exit
flutter clean
cd - || exit