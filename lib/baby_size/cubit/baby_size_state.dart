import 'package:baby_repository/baby_repository.dart';
import 'package:equatable/equatable.dart';

class BabySizeState extends Equatable {
  const BabySizeState({
    required this.baby,
    this.newHeadSize,
    this.newHeight,
    this.newWeight,
    this.dateTime,
  });

  final Baby baby;
  final double? newHeight;
  final double? newWeight;
  final double? newHeadSize;
  final DateTime? dateTime;

  static BabySizeState initial = BabySizeState(baby: Baby.empty());

  bool isValid() =>
      dateTime != null &&
      newHeight != null &&
      newWeight != null &&
      newHeadSize != null;

  BabySizeState copyWith({
    Baby? baby,
    double? newHeight,
    double? newWeight,
    double? newHeadSize,
    DateTime? dateTime,
  }) {
    return BabySizeState(
      baby: baby ?? this.baby,
      newHeadSize: newHeadSize ?? this.newHeadSize,
      newHeight: newHeight ?? this.newWeight,
      newWeight: newWeight ?? this.newWeight,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props =>
      [baby, newHeadSize, newWeight, newHeight, dateTime];
}
