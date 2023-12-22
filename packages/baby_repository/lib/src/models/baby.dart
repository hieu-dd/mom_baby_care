import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Baby extends Equatable {
  const Baby({required this.name, this.nickname, required this.birthDay});

  static Baby empty() => Baby(name: "", birthDay: DateTime.now());

  final String name;
  final String? nickname;
  final DateTime birthDay;

  factory Baby.fromJson(Map<String, dynamic> json) {
    return Baby(
      name: json['name'] as String,
      nickname: json['nickname'] as String?,
      birthDay: DateFormat('yyyy-MM-dd').parse(json['birthDay'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'birthDay': DateFormat('yyyy-MM-dd').format(birthDay),
    };
  }

  Baby copyWith({String? newName, String? newNickname, DateTime? newBirthDay}) {
    return Baby(
      name: newName ?? name,
      nickname: newNickname ?? nickname,
      birthDay: newBirthDay ?? birthDay,
    );
  }

  @override
  List<Object?> get props => [name, nickname, birthDay];
}
