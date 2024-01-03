import 'package:baby_repository/baby_repository.dart';
import 'package:equatable/equatable.dart';

class BabyInfoState extends Equatable {
  const BabyInfoState({
    required this.name,
    required this.gender,
    this.nickname,
    this.birthday,
  });

  final String name;
  final String? nickname;
  final Gender gender;
  final DateTime? birthday;

  static BabyInfoState empty = const BabyInfoState(
    name: '',
    gender: Gender.other,
  );

  BabyInfoState copyWith({
    String? name,
    String? nickname,
    Gender? gender,
    DateTime? birthday,
  }) {
    return BabyInfoState(
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
    );
  }

  @override
  List<Object?> get props => [name, nickname, gender, birthday];
}
