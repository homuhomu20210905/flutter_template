import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_template/infra/repository/tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// このファイルの名前が"database.dart"の場合は以下の名前で定義しておく。
// このタイミングだとファイルが存在しないためエラーが出るが、後の工程で自動作成される。
part 'database.g.dart';

// DriftDatabaseに上記の2テーブルを指定して、Driftで扱えるよう設定する。
// 今のタイミングではMyDatabeseクラスは空で良い。
// "_$MyDatabase"が存在しないと怒られるが気にしない。
@DriftDatabase(tables: [Todos, Categories])
class MyDatabase extends _$MyDatabase {
  MyDatabase._internal() : super(_openConnection());

  static MyDatabase? _instance;

  static MyDatabase getInstance() {
    _instance ??= MyDatabase._internal();
    return _instance!;
  }

  @override
  int get schemaVersion => 2;
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.addColumn(todos, todos.createdAt);
            await m.addColumn(todos, todos.updatedAt);
            await m.addColumn(categories, categories.createdAt);
            await m.addColumn(categories, categories.updatedAt);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON;');
        },
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // PCの場合はドキュメントフォルダに"db.sqlite"が作成される
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
