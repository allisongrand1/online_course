import 'package:flutter/material.dart';
import 'package:presistance_data/task_1/categories.dart';
import 'package:presistance_data/task_1/hive.dart';
import 'package:presistance_data/task_1/ui/third_page.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  final int id;
  const SecondPage(this.id, {super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerDescription;
  late int listInt;
  @override
  void initState() {
    _controllerName = TextEditingController(text: '');
    _controllerDescription = TextEditingController(text: '');
    getList();
    super.initState();
  }

  void getList() async {
    listInt =
        await context.read<HiveDatabase>().getCategory(widget.id).then((value) {
      if (value.isEmpty) {
        return 1;
      } else {
        return value.last.id + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Category>>(
          future: context.read<HiveDatabase>().getCategory(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => ThirdPage(
                                  widget.id, snapshot.data![index].id),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 50,
                          child: Card(
                            child: Center(
                              child: Text(
                                snapshot.data![index].name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ));
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Добавление новой категории'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text('Название подкаталога')),
                        controller: _controllerName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill this field";
                          }
                          return null;
                        },
                        /* onChanged: (value) {
                          _controller.text = value;
                        }, */
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text('Описание подкаталога')),
                        controller: _controllerDescription,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill this field";
                          }
                          return null;
                        },
                        /* onChanged: (value) {
                          _controller.text = value;
                        }, */
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Отмена')),
                    TextButton(
                        onPressed: () {
                          context.read<HiveDatabase>().addCategory(
                              Category(
                                  id: listInt,
                                  name: _controllerName.text,
                                  description: _controllerDescription.text),
                              widget.id);
                          setState(() {
                            context.read<HiveDatabase>().getCategory(widget.id);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ок'))
                  ],
                );
              });

          setState(() {});
        },
      ),
    );
  }
}
