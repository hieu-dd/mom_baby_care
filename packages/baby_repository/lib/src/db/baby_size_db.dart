import 'package:drift/drift.dart';

class BabySizeEntities extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get headSize => real()();

  RealColumn get weight => real()();

  RealColumn get height => real()();

  DateTimeColumn get time => dateTime()();
}
