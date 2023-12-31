import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class BabySize extends Equatable {
  BabySize({
    required this.id,
    required this.headSize,
    required this.height,
    required this.weight,
    DateTime? time,
  }) : time = time ?? DateTime.now();

  final String id;
  final double height;
  final double weight;
  final double headSize;
  final DateTime time;

  factory BabySize.fromJson(Map<String, dynamic> json) {
    return BabySize(
      id: json['id'] as String,
      height: json['height'] as double,
      weight: json['weight'] as double,
      headSize: json['headSize'] as double,
      time: DateFormat('yyyy-MM-dd').parse(json['time'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'height': height,
      'weight': weight,
      'headSize': headSize,
      'time': DateFormat('yyyy-MM-dd').format(time),
    };
  }

  @override
  List<Object> get props => [id, height, weight, headSize, time];
}
