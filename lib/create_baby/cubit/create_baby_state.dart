import 'package:baby_repository/baby_repository.dart';
import 'package:equatable/equatable.dart';

class CreateBabState extends Equatable {
  const CreateBabState(
      {required this.name,
      this.nickname,
      this.gender = Gender.other,
      this.birthday});

  final String name;
  final String? nickname;
  final Gender gender;
  final DateTime? birthday;

  static const empty = CreateBabState(name: '');

  bool get isValid => name.isNotEmpty && birthday != null;

  CreateBabState copyWith({
    String? name,
    String? nickname,
    Gender? gender,
    DateTime? birthday,
  }) {
    return CreateBabState(
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
    );
  }

  @override
  List<Object?> get props => [name, nickname, gender, birthday];
}
