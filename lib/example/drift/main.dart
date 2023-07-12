import 'package:flutter/material.dart';
import 'package:presistance_data/example/floor/database.dart';

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
  AppDatabase? _database;
  List<Person> _persons = [];

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final personDao = _database!.personDao;

    _persons = await personDao.findAllPersons();
    setState(() {});
  }

  void _insertPerson(Person person) async {
    await _database!.personDao.insertPerson(person);
    _persons = await _database!.personDao.findAllPersons();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _persons.length,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Text('${_persons[index].id} -${_persons[index].name}'),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insertPerson(Person(4, 'name'));
        },
        tooltip: 'add',
        child: const Icon(Icons.abc),
      ),
    );
  }
}
