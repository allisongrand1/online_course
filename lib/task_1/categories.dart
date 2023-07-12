import 'package:hive/hive.dart';

part 'categories.g.dart';

@HiveType(typeId: 0)
class Categories {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  List<Category>? category;

  Categories({required this.id, required this.name, required this.category});
}

@HiveType(typeId: 1)
class Category {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;

  Category({required this.id, required this.name, required this.description});
}
