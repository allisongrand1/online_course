import 'package:floor/floor.dart';
import 'package:presistance_data/task_3/datebase.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<Person?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Person person);
  @update
  Future<void> updatePerson(Person person);
  @Query('DELETE FROM Person WHERE id = :id')
  Future<void> deletePerson(int id);
}
