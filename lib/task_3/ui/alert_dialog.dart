import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:presistance_data/task_3/datebase.dart';

class AlertDialogAccount extends StatefulWidget {
  final String firstName;
  final String lastName;
  final int age;
  final int id;
  final String phone;
  final String bank;
  final AppDatabase database;
  const AlertDialogAccount(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.phone,
      required this.bank,
      required this.id,
      required this.database});

  @override
  State<AlertDialogAccount> createState() => _AlertDialogAccountState();
}

class _AlertDialogAccountState extends State<AlertDialogAccount> {
  late TextEditingController _controllerFirstName;
  late TextEditingController _controllerLastName;
  late TextEditingController _controllerAge;
  late TextEditingController _controllerBank;
  List<Person> _persons = [];
  FlutterSecureStorage? storage;

  @override
  void initState() {
    super.initState();
    _controllerFirstName = TextEditingController(text: widget.firstName);
    _controllerLastName = TextEditingController(text: widget.lastName);
    _controllerAge = TextEditingController(text: widget.age.toString());
    _controllerBank = TextEditingController(text: widget.bank);
    storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device));
  }

  savePerson(String firstName, String lastName, int age, String bank) async {
    final personDao = await widget.database.personDao.findPersonById(widget.id);
    _persons = await widget.database.personDao.findAllPersons();
    final Person newPerson = personDao!.copyWith(
      firstName: firstName,
      lastName: lastName,
      age: age,
    );
    await widget.database.personDao.updatePerson(newPerson);

    final newBankCard =
        _persons.where((element) => element.id == newPerson.id).toList();
    for (var person in newBankCard) {
      await storage?.write(key: person.id.toString(), value: bank);
      await storage!.read(key: person.id.toString());
    }
    _persons = await widget.database.personDao.findAllPersons();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Информация'),
      content: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controllerFirstName,
                    decoration: const InputDecoration(label: Text('Имя')),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controllerLastName,
                    decoration: const InputDecoration(label: Text('Фамилия')),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: _controllerAge,
              decoration: const InputDecoration(label: Text('Сколько лет?')),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: _controllerBank,
              decoration: const InputDecoration(label: Text('Реквизиты')),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              savePerson(_controllerFirstName.text, _controllerLastName.text,
                  int.parse(_controllerAge.text), _controllerBank.text);
              Navigator.of(context).pop();
            },
            child: const Text('Ок'))
      ],
    );
  }
}
