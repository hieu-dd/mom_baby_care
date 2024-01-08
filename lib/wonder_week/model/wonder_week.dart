import 'package:equatable/equatable.dart';

class WonderWeek extends Equatable {
  final double start;
  final double end;

  const WonderWeek({required this.start, required this.end});

  @override
  List<Object> get props => [start, end];
}
