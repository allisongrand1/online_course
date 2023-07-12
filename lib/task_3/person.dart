import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final int id;

  final String? firstName;
  final String? lastName;
  final int? age;
  final String image;
  final String phone;
  Person(
      this.id, this.firstName, this.lastName, this.age, this.image, this.phone);

  Person copyWith({
    String? firstName,
    String? lastName,
    int? age,
    String? image,
    String? phone,
  }) {
    return Person(this.id, firstName, lastName, age, this.image, this.phone);
  }
}
