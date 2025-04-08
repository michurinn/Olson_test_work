import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:olkon_test_work/core/database/daos/comments_dao.dart';
import 'package:olkon_test_work/core/database/daos/news_dao.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

class NewsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get author => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get urlToImage => text().nullable()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  TextColumn get content => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class CommentsTable extends Table {
  IntColumn get id => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get photoId => text().nullable()();
  BoolColumn get unread => boolean().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DriftDatabase(tables: [NewsTable, CommentsTable], daos: [NewsDao, CommentsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
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
