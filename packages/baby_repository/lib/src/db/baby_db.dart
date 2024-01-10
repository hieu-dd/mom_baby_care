import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'baby_db.g.dart';

class Babies extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get nickname => text()();

  DateTimeColumn get birthday => dateTime()();

  TextColumn get gender => text()();
}

@DriftDatabase(tables: [Babies])
class BabiesDatabase extends _$BabiesDatabase {
  BabiesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Create
  Future<int> upsert(BabiesCompanion baby) {
    return into(babies).insertOnConflictUpdate(baby);
  }

  // Read all babies
  Future<List<Baby>> getAllBabies() {
    return select(babies).get();
  }

  // Read a single baby by id
  Future<Baby?> getBabyById(int id) {
    return (select(babies)..where((b) => b.id.equals(id))).getSingleOrNull();
  }

  // Update
  Future<bool> updateBaby(BabiesCompanion baby) {
    return update(babies).replace(baby);
  }

  // Delete
  Future<int> deleteBaby(int id) {
    return (delete(babies)..where((b) => b.id.equals(id))).go();
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
