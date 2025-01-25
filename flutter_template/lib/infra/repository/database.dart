import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// このファイルの名前が"database.dart"の場合は以下の名前で定義しておく。
// このタイミングだとファイルが存在しないためエラーが出るが、後の工程で自動作成される。
part 'database.g.dart';

// 以下の定義の場合だと"todos"というテーブルが作成される。
// 行単位のデータは"Todoクラス"になる。
// 　※Todoクラスはこの後の工程で自動で作成される。
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
  // 登録日時（デフォルトで現在時刻を設定）
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  // 更新日時（手動で更新時に変更）
  DateTimeColumn get updatedAt => dateTime()();
}

// Driftでは行単位のデータを扱うクラスを作成するときはテーブルクラスから"s"を除いたものを作成するため、
// 単数形と複数形で形が異なる場合は"DataClassName"で単数形の名称を定義する必要がある。
// DataNameClassを定義しない場合は"Categorie"になってしまう。
@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  // 登録日時（デフォルトで現在時刻を設定）
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  // 更新日時（手動で更新時に変更）
  DateTimeColumn get updatedAt => dateTime()();
}

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

  // マイグレーションを行う場合に使用ため、テーブルを追加／変更／削除する場合はこの値をインクリメントする
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
