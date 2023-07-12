import 'package:hive/hive.dart';

/* part 'person.g.dart'; */

@HiveType(typeId: 100)
class Person {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  Person(this.name, this.age);
}
