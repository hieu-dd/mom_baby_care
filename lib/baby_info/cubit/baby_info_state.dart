import 'package:baby_repository/baby_repository.dart';
import 'package:equatable/equatable.dart';

class BabyInfoState extends Equatable {
  const BabyInfoState({
    required this.baby,
    required this.name,
    required this.gender,
    this.nickname,
    this.birthday,
  });

  final Baby baby;
  final String name;
  final String? nickname;
  final Gender gender;
  final DateTime? birthday;

  static BabyInfoState empty = BabyInfoState(
    name: '',
    baby: Baby.empty,
    gender: Gender.other,
  );

  BabyInfoState copyWith({
    Baby? baby,
    String? name,
    String? nickname,
    Gender? gender,
    DateTime? birthday,
  }) {
    return BabyInfoState(
      baby: baby ?? this.baby,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
    );
  }

  @override
  List<Object?> get props => [baby, name, nickname, gender, birthday];
}
