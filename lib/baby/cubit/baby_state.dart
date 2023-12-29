import 'package:baby_repository/baby_repository.dart';
import 'package:equatable/equatable.dart';

class BabyState extends Equatable {
  const BabyState({required this.baby});

  final Baby baby;

  static BabyState initial = BabyState(baby: Baby.empty);

  BabyState copyWith(Baby? baby) {
    return BabyState(baby: baby ?? this.baby);
  }

  @override
  List<Object> get props => [baby];
}
