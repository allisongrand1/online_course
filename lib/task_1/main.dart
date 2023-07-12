import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:presistance_data/task_1/categories.dart';
import 'package:presistance_data/task_1/hive.dart';
import 'package:presistance_data/task_1/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoriesAdapter());
  Hive.registerAdapter(CategoryAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final HiveDatabase _hiveDatabase = HiveDatabaseImpl();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => _hiveDatabase,
      child: MaterialApp(
          title: 'Task1',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage()),
    );
  }
}
