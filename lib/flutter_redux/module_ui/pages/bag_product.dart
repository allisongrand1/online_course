// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_action.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_state.dart';

class BagProduct extends StatelessWidget {
  const BagProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Корзина"),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, products) {
            return Column(children: [
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: products.listOfBag.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: SizedBox(
                            width: 50,
                            height: 50,
                            child:
                                Image.network(products.listOfBag[index].image)),
                        title: Text(products.listOfBag[index].title),
                        subtitle: Text(
                            "${products.listOfBag[index].amount.toString()}₽"),
                        trailing: StoreConnector<AppState, VoidCallback>(
                            converter: (store) {
                          return () => store.dispatch(
                              DeleteAction(products.listOfBag[index]));
                        }, builder: (context, callback) {
                          return IconButton(
                            onPressed: callback,
                            icon: const Icon(Icons.clear),
                          );
                        }));
                  },
                ),
              ),
              Expanded(flex: 1, child: Text('${products.sumOfProducts}₽')),
            ]);
          }),
    );
  }
}
