import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:presistance_data/task_3/datebase.dart';
import 'package:presistance_data/task_3/ui/alert_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppDatabase? _database;
  List<Person> _persons = [];
  FlutterSecureStorage? storage;
  String kCounterKey = '';
  String _bankCard = '';
  int id = 0;
  late TextEditingController _controllerFirstName;
  late TextEditingController _controllerLastName;
  late TextEditingController _controllerAge;
  late TextEditingController _controllerBank;
  late TextEditingController _controllerPhone;

  @override
  void initState() {
    super.initState();
    _controllerFirstName = TextEditingController(text: '');
    _controllerLastName = TextEditingController(text: '');
    _controllerAge = TextEditingController(text: '');
    _controllerBank = TextEditingController(text: '');
    _controllerPhone = TextEditingController(text: '');
    storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device));
    _initialize();
  }

  void _initialize() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final personDao = _database!.personDao;

    _persons = await personDao.findAllPersons();
    setState(() {});
    for (var person in _persons) {
      final bankValue = await storage!.read(key: person.id.toString());
      _bankCard = bankValue ?? '777 666 555 444';
    }
    setState(() {});
  }

  void _insertPerson(Person person, String bank) async {
    await _database!.personDao.insertPerson(person);
    _persons = await _database!.personDao.findAllPersons();
    setState(() {});
    final newBankCard =
        _persons.where((element) => element.id == person.id).toList();
    for (var person in newBankCard) {
      await storage?.write(key: person.id.toString(), value: bank);
      final bankValue = await storage!.read(key: person.id.toString());
      setState(() {
        _bankCard = bankValue ?? '777 666 555 444';
      });
    }
    _persons = await _database!.personDao.findAllPersons();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _database!.personDao.findAllPersons().then((value) async {
                    _persons = value;
                    storage!.readAll();
                  });
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
          itemCount: _persons.length,
          itemBuilder: (context, index) {
            id = _persons.last.id;
            return Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      await _database!.personDao
                          .deletePerson(_persons[index].id);
                      setState(() {
                        _database!.personDao
                            .findAllPersons()
                            .then((value) async {
                          _persons = value;
                          storage!.readAll();
                        });
                      });
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialogAccount(
                            id: id,
                            firstName: _persons[index].firstName!,
                            lastName: _persons[index].lastName!,
                            age: _persons[index].age!,
                            phone: _persons[index].phone,
                            bank: _bankCard,
                            database: _database!,
                          ));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                      title: Text(
                          '${_persons[index].firstName} ${_persons[index].lastName}'),
                      subtitle: Text('${_persons[index].age} лет'),
                      trailing: Text(_bankCard),
                      leading: Image.network(
                        _persons[index].image,
                        width: 50,
                      )),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Информация'),
              content: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controllerFirstName,
                            decoration:
                                const InputDecoration(label: Text('Имя')),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerLastName,
                            decoration:
                                const InputDecoration(label: Text('Фамилия')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controllerAge,
                      decoration:
                          const InputDecoration(label: Text('Сколько лет?')),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controllerBank,
                      decoration:
                          const InputDecoration(label: Text('Банковских счет')),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controllerPhone,
                      decoration: const InputDecoration(label: Text('Телефон')),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _insertPerson(
                        Person(
                            id + 1,
                            _controllerFirstName.text,
                            _controllerLastName.text,
                            int.parse(_controllerAge.text),
                            "https://coolsen.ru/wp-content/uploads/2021/10/022-20211031_182237.jpg",
                            _controllerPhone.text),
                        _controllerBank.text);
                    _controllerFirstName.text = '';
                    _controllerLastName.text = '';
                    _controllerAge.text = '';
                    _controllerPhone.text = '';
                    _controllerBank.text = '';
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          /* showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // dismisses only the dialog and returns nothing
                      },
                      child: Text('Отмена'),
                    ),
                    TextButton(
                      onPressed: () {
                        _insertPerson(
                            Person(
                                id + 1,
                                _controllerFirstName.text,
                                _controllerLastName.text,
                                int.parse(_controllerAge.text),
                                "https://www.fonstola.ru/pic/201401/1920x1080/fonstola.ru_141324.jpg",
                                _controllerPhone.text),
                            _controllerBank.text);
                      },
                      child: Text('Сохранить'),
                    ),
                  ],
                  title: Text('Информация'),
                  content: Container(
                    height: 300,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextFormField(
                              controller: _controllerFirstName,
                              decoration: InputDecoration(label: Text('Имя')),
                            ),
                            TextFormField(
                              controller: _controllerLastName,
                              decoration:
                                  InputDecoration(label: Text('Фамилия')),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _controllerAge,
                          decoration:
                              InputDecoration(label: Text('Сколько лет?')),
                        ),
                        TextFormField(
                          controller: _controllerBank,
                          decoration:
                              InputDecoration(label: Text('Банковских счет')),
                        ),
                        TextFormField(
                          controller: _controllerPhone,
                          decoration: InputDecoration(label: Text('Телефон')),
                        ),
                      ],
                    ),
                  ),
                );
              }); */
        },
        tooltip: 'add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
