// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/flutter_mobx/module_domain/mobx_state.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ExampleState>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Магазин"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/bag');
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: Observer(builder: (context) {
          return ListView.builder(
            itemCount: list.listInHome.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(list.listInHome[index].image)),
                  title: Text(list.listInHome[index].title),
                  subtitle:
                      Text("${list.listInHome[index].amount.toString()}₽"),
                  trailing: IconButton(
                    onPressed: () => list.addInBag(list.listInHome[index]),
                    icon: list.listInHome[index].isInBag
                        ? const Icon(Icons.done)
                        : const Icon(Icons.add),
                  ));
            },
          );
        }));
  }
}
