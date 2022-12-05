// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:state_managment/bloc_stream-controller/module_domain/bloc.dart';

class BagProduct extends StatelessWidget {
  const BagProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BagBloc bloc = BagBloc();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Корзина"),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: StreamBuilder(
                    stream: bloc.stateStream,
                    builder: (context, snapshot) {
                      print('Корзина ${snapshot.data}');
                      if (snapshot.connectionState == ConnectionState.active) {
                        return ListView.builder(
                          itemCount: snapshot
                              .data!.length, // сколько раз повторится цикл
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                        snapshot.data![index].image)),
                                title: Text(snapshot.data![index].title),
                                subtitle: Text(
                                    "${snapshot.data![index].amount.toString()}₽"),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.clear),
                                ));
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Container();
                    })),
            const Expanded(flex: 1, child: Text('')),
          ],
        ));
  }
}
