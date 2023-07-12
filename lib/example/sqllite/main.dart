import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database? db;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    db =
        await openDatabase(join(await getDatabasesPath(), 'doogie_database.db'),
            onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    }, version: 1);
    setState(() {});
  }

  Future<void> insertDog(Dog dog) async {
    await db!.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    setState(() {});
  }

  Future<void> updateDog(Dog dog) async {
    await db!.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);

    setState(() {});
  }

  Future<void> deleteDog(int id) async {
    await db!.delete('dogs', where: 'id = ?', whereArgs: [id]);

    setState(() {});
  }

  Future<List<Dog>> dogs() async {
    final List<Map<String, dynamic>> maps = await db!.query('dogs');

    return List.generate(
        maps.length,
        (index) => Dog(
            id: maps[index]['id'],
            name: maps[index]['name'],
            age: maps[index]['age']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Dog>>(
          future: dogs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(itemBuilder: (context, index) {
              final dog = snapshot.data![index];
              return Container(
                height: 60,
                padding: const EdgeInsets.symmetric(),
                child: Align(
                  child: Text('${dog.id} - ${dog.name} - ${dog.age}'),
                ),
              );
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => insertDog(Dog(id: 1, name: 'name', age: 1)),
        tooltip: 'Increment',
        child: const Icon(Icons.abc),
      ),
    );
  }
}
