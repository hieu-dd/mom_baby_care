import 'package:baby_repository/baby_repository.dart';
import 'package:equatable/equatable.dart';

import '../wonder_week.dart';

class WonderWeekState extends Equatable {
  const WonderWeekState({required Baby baby}) : _baby = baby;
  final Baby _baby;
  final List<WonderWeek> wonderWeeks = _wonderWeeks;

  static WonderWeekState empty = WonderWeekState(baby: Baby.empty);

  double get weekAge => DateTime.now().difference(dueDate).inDays / 7;

  DateTime get dueDate => _baby.dueDate ?? _baby.birthday;

  @override
  List<Object> get props => [_baby];
}

const _wonderWeeks = [
  WonderWeek(start: 4.5, end: 5.5),
  WonderWeek(start: 7.5, end: 9.5),
  WonderWeek(start: 11.5, end: 12.5),
  WonderWeek(start: 14.5, end: 19.5),
  WonderWeek(start: 22.5, end: 26.5),
  WonderWeek(start: 33.5, end: 37.5),
  WonderWeek(start: 41.5, end: 46.5),
  WonderWeek(start: 51.5, end: 54.5),
  WonderWeek(start: 59.5, end: 61.5),
  WonderWeek(start: 70.5, end: 76.5),
];
