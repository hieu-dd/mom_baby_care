import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'baby_size.dart';

enum Gender { male, female, other }

class Baby extends Equatable {
  const Baby({
    required this.id,
    required this.name,
    this.nickname,
    required this.birthDay,
    this.sizes = const [],
    this.gender = Gender.other,
  });

  static Baby empty() => Baby(id: '', name: '', birthDay: DateTime.now());

  bool get isEmpty => name == '';
  final String id;
  final String name;
  final String? nickname;
  final DateTime birthDay;
  final List<BabySize> sizes;
  final Gender gender;

  factory Baby.fromJson(Map<String, dynamic> json) {
    return Baby(
      id: json['id'] as String,
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
      'id': id,
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
    List<BabySize>? addSizes,
    List<BabySize>? sizes,
  }) {
    return Baby(
      id: id,
      name: newName ?? name,
      nickname: newNickname ?? nickname,
      birthDay: newBirthDay ?? birthDay,
      sizes: (sizes ?? [...this.sizes, ...?addSizes]).toSet().toList(),
    );
  }

  @override
  List<Object?> get props => [id, name, nickname, birthDay, gender, sizes];
}
