import 'package:floor/floor.dart';
import 'package:presistance_data/example/floor/database.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<List<Person?>> findPersonById(int id);

  @insert
  Future<void> insertPerson(Person person);
}
