import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'baby_size.dart';

enum Gender { male, female, other }

class Baby extends Equatable {
  const Baby({
    required this.name,
    this.nickname,
    required this.birthDay,
    this.sizes = const [],
    this.gender = Gender.other,
  });

  static Baby empty() => Baby(name: '', birthDay: DateTime.now());

  bool get isEmpty => name == '';
  final String name;
  final String? nickname;
  final DateTime birthDay;
  final List<BabySize> sizes;
  final Gender gender;

  factory Baby.fromJson(Map<String, dynamic> json) {
    return Baby(
      name: json['name'] as String,
      nickname: json['nickname'] as String?,
      birthDay: DateFormat('yyyy-MM-dd').parse(json['birthDay'] as String),
      sizes: (json['sizes'] as List<dynamic>?)
              ?.map((size) => BabySize.fromJson(size as Map<String, dynamic>))
              .toList() ??
          [],
      gender: Gender.values.byName(json['gender']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'birthDay': DateFormat('yyyy-MM-dd').format(birthDay),
      'sizes': sizes.map((size) => size.toJson()).toList(),
      'gender': gender.name
    };
  }

  Baby copyWith({
    String? newName,
    String? newNickname,
    DateTime? newBirthDay,
    List<BabySize>? newSizes,
  }) {
    return Baby(
      name: newName ?? name,
      nickname: newNickname ?? nickname,
      birthDay: newBirthDay ?? birthDay,
      sizes: List.from(newSizes ?? sizes),
    );
  }

  @override
  List<Object?> get props => [name, nickname, birthDay, gender];
}
