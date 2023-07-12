import 'package:hive/hive.dart';
import 'package:presistance_data/task_1/categories.dart';

abstract class HiveDatabase {
  ///* [getListOfCategories] - Метод отдает весь список [Categories]
  Future<List<Categories>> getListOfCategories();

  ///* [getCategory] - Метод отдает весь список [Category]
  Future<List<Category>> getCategory(int id);

  ///* [getDescriptionOfCategory] - Метод описание [Category]
  Future<Category?> getDescriptionOfCategory(int idCategories, int idCategory);

  ///* [addCategories] - Метод добавлет [Categories] в список
  Future<void> addCategories(Categories value);

  ///* [addCategory] - Метод добавлет [Categories] в список
  Future<void> addCategory(Category value, int id);
}

class HiveDatabaseImpl extends HiveDatabase {
  @override
  Future<void> addCategories(Categories value) async {
    var box = await Hive.openBox<Categories>('Categories');
    var categories = box.get(value.id);
    if (categories == null) {
      await box.put(value.id, value);
      return;
    } else {
      return;
    }
  }

  @override
  Future<List<Categories>> getListOfCategories() async {
    var box = await Hive.openBox<Categories>('Categories');
    return box.values.toList();
  }

  @override
  Future<List<Category>> getCategory(int id) async {
    var box = await Hive.openBox<Categories>('Categories');
    var categories = box.get(id);
    if (categories?.category != null) {
      return categories!.category!.toList();
    } else {
      return [];
    }
  }

  @override
  Future<Category?> getDescriptionOfCategory(
      int idCategories, int idCategory) async {
    var box = await Hive.openBox<Categories>('Categories');
    var categories = box.get(idCategories);
    if (categories?.category != null) {
      return categories!.category!
          .firstWhere((element) => element.id == idCategory);
    }
    return null;
  }

  @override
  Future<void> addCategory(Category value, int id) async {
    var box = await Hive.openBox<Categories>('Categories');
    var categories = box.get(id);
    if (categories == null) {
      return;
    } else {
      categories.category!.add(value);
      await box.put(id, categories);
      return;
    }
  }
}
