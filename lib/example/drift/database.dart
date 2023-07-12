import 'package:drift/drift.dart';

//part 'database.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('named')();
  IntColumn get category => integer().nullable()();
}

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

  
	/* @DriftDatabase(tables: [Todos, Categories])
	class MyDatabase extends _$MyDatabase {
		MyDatabase() : super(_openConnection());
		@override
		int get schemaVersion => 1;
	} */

