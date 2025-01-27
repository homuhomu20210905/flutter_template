// 以下の定義の場合だと"todos"というテーブルが作成される。
// 行単位のデータは"Todoクラス"になる。
// 　※Todoクラスはこの後の工程で自動で作成される。
import 'package:drift/drift.dart';

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
