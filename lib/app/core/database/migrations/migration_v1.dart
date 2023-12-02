import 'package:cuidapet_mobile/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute(
        '''
    CREATE TABLE Address (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      address TEXT not null,
      lat TEXT,
      lng TEXT,
      additional TEXT
    )
''');
  }

  @override
  void update(Batch batch) {}
}
