import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'baby_db.g.dart';

class BabyEntities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get nickname => text()();

  DateTimeColumn get birthday => dateTime()();

  TextColumn get gender => text()();
}

class BabySizeEntities extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get babyId => integer()();

  RealColumn get headSize => real()();

  RealColumn get weight => real()();

  RealColumn get height => real()();

  DateTimeColumn get time => dateTime()();
}

@DriftDatabase(tables: [BabyEntities, BabySizeEntities])
class BabiesDatabase extends _$BabiesDatabase {
  BabiesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Create
  Future<int> upsert(BabyEntitiesCompanion baby) {
    return into(babyEntities).insertOnConflictUpdate(baby);
  }

  // Read all babies
  Future<List<BabyEntity>> getAllBabies() {
    return select(babyEntities).get();
  }

  // Read a single baby by id
  Future<BabyEntity?> getBabyById(int id) {
    return (select(babyEntities)..where((b) => b.id.equals(id)))
        .getSingleOrNull();
  }

  // Update
  Future<bool> updateBaby(BabyEntitiesCompanion baby) {
    return update(babyEntities).replace(baby);
  }

  // Delete
  Future<int> deleteBaby(int id) {
    return (delete(babyEntities)..where((b) => b.id.equals(id))).go();
  }

  Future<int> upsertBabySize(BabySizeEntitiesCompanion entity) {
    return into(babySizeEntities).insertOnConflictUpdate(entity);
  }

  Future<List<BabySizeEntity>> getBabySizesById(int id) {
    return (select(babySizeEntities)..where((b) => b.id.equals(id))).get();
  }

  Stream<List<BabySizeEntity>> watchBabySizesById(int id) {
    return (select(babySizeEntities)..where((b) => b.babyId.equals(id)))
        .watch();
  }

  Future<int> deleteBabySize(int id) {
    return (delete(babySizeEntities)..where((b) => b.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
