import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'baby_size.dart';

enum Gender { male, female, other }

class Baby extends Equatable {
  const Baby({
    required this.id,
    required this.name,
    this.nickname,
    required this.birthday,
    this.sizes = const [],
    this.gender = Gender.other,
    this.dueDate,
  });

  static Baby empty = Baby(id: '0', name: '', birthday: DateTime.now());

  bool get isEmpty => name == '';
  final String id;
  final String name;
  final String? nickname;
  final DateTime birthday;
  final List<BabySize> sizes;
  final Gender gender;
  final DateTime? dueDate;

  factory Baby.fromJson(Map<String, dynamic> json) {
    return Baby(
      id: json['id'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String?,
      birthday: DateFormat('yyyy-MM-dd').parse(json['birthDay'] as String),
      dueDate: json['dueDate'] != null
          ? DateFormat('yyyy-MM-dd').parse(json['dueDate'] as String)
          : null,
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
      'birthDay': DateFormat('yyyy-MM-dd').format(birthday),
      'dueDate':
          dueDate != null ? DateFormat('yyyy-MM-dd').format(dueDate!) : null,
      'sizes': sizes.map((size) => size.toJson()).toList(),
      'gender': gender.name
    };
  }

  Baby copyWith({
    String? name,
    String? nickname,
    DateTime? birthday,
    DateTime? dueDate,
    List<BabySize>? addSizes,
    List<BabySize>? sizes,
    Gender? gender,
  }) {
    return Baby(
      id: id,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      birthday: birthday ?? this.birthday,
      dueDate: dueDate ?? this.dueDate,
      sizes: (sizes ?? [...this.sizes, ...?addSizes]).toSet().toList(),
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        nickname,
        birthday,
        dueDate,
        gender,
        sizes,
      ];
}
