// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/flutter_mobx/module_domain/mobx_state.dart';

class BagProduct extends StatelessWidget {
  const BagProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ExampleState>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Корзина"),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Observer(builder: (context) {
          return Column(children: [
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: list.listInBag.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(list.listInBag[index].image)),
                      title: Text(list.listInBag[index].title),
                      subtitle:
                          Text("${list.listInBag[index].amount.toString()}₽"),
                      trailing: IconButton(
                        onPressed: () =>
                            list.deleteFromBag(list.listInBag[index]),
                        icon: const Icon(Icons.clear),
                      ));
                },
              ),
            ),
            Expanded(flex: 1, child: Text('${list.sum}₽')),
          ]);
        }));
  }
}
