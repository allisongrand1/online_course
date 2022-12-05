// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:state_managment/bloc_stream-controller/module_domain/bloc.dart';
import 'package:state_managment/bloc_stream-controller/module_domain/bloc_event.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  ProductBloc bloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Магазин"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/bag');
                print("Передаем список в корзину через событие${bloc.bag}");
                bloc.eventSink.add(InBagEvent(bloc.bag));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: StreamBuilder(
          stream: bloc.stateStream,
          builder: (context, snapshot) {
            print(bloc.bag);
            print('Дом ${snapshot.data}');
            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: (snapshot.connectionState ==
                                  ConnectionState.waiting)
                              ? const CircularProgressIndicator()
                              : Image.network(snapshot.data![index].image)),
                      title: Text(snapshot.data![index].title),
                      subtitle:
                          Text("${snapshot.data![index].amount.toString()}₽"),
                      trailing: IconButton(
                        onPressed: () {
                          bloc.eventSink
                              .add(AddInBagEvent(snapshot.data![index]));
                        },
                        icon: snapshot.data![index].isInBag
                            ? const Icon(Icons.done)
                            : const Icon(Icons.add),
                      ));
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Container();
          }),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
