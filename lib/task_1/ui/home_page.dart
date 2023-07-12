import 'package:flutter/material.dart';
import 'package:presistance_data/task_1/categories.dart';
import 'package:presistance_data/task_1/hive.dart';
import 'package:presistance_data/task_1/model.dart';
import 'package:presistance_data/task_1/ui/second_page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  late int listInt;
  @override
  void initState() {
    context.read<HiveDatabase>().addCategories(categories);
    _controller = TextEditingController(text: '');
    getList();
    super.initState();
  }

  void getList() async {
    listInt = await context
        .read<HiveDatabase>()
        .getListOfCategories()
        .then((value) => value.last.id + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Categories>>(
          future: context.read<HiveDatabase>().getListOfCategories(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  SecondPage(snapshot.data![index].id),
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
                            label: Text('Название каталога')),
                        controller: _controller,
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
                          context.read<HiveDatabase>().addCategories(Categories(
                              id: listInt,
                              name: _controller.text,
                              category: <Category>[]));
                          setState(() {
                            context.read<HiveDatabase>().getListOfCategories();
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
