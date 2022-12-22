// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_action.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_state.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, list) {
          return ListView.builder(
            itemCount: list.listOfProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(list.listOfProducts[index].image)),
                  title: Text(list.listOfProducts[index].title),
                  subtitle:
                      Text("${list.listOfProducts[index].amount.toString()}₽"),
                  trailing: StoreConnector<AppState, VoidCallback>(
                      converter: (store) {
                    return () =>
                        store.dispatch(AddAction(list.listOfProducts[index]));
                  }, builder: (context, callback) {
                    return IconButton(
                      onPressed: callback,
                      icon: list.listOfProducts[index].isInBag
                          ? const Icon(Icons.done)
                          : const Icon(Icons.add),
                    );
                  }));
            },
          );
        },
      ),
    );
  }
}
