// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc_event.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc_state.dart';

class BagProduct extends StatefulWidget {
  const BagProduct({Key? key}) : super(key: key);

  @override
  State<BagProduct> createState() => _BagProductState();
}

class _BagProductState extends State<BagProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Корзина"),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
              BlocProvider.of<ProductBloc>(context).add(const LoadedEvent());
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: BlocBuilder<BagBloc, ProductState>(
                    builder: (context, state) {
                  if (state is LoadedState) {
                    return ListView.builder(
                      itemCount: state.listOfProduct.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(
                                    state.listOfProduct[index].image)),
                            title: Text(state.listOfProduct[index].title),
                            subtitle: Text(
                                "${state.listOfProduct[index].amount.toString()}₽"),
                            trailing: IconButton(
                              onPressed: () {
                                context.read<BagBloc>().add(DeleteInBagEvent(
                                    state.listOfProduct[index]));
                              },
                              icon: const Icon(Icons.clear),
                            ));
                      },
                    );
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.message));
                  } else if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container();
                })),
            Expanded(
                flex: 1, child: Text('${context.watch<BagBloc>().getSum}₽')),
          ],
        ));
  }
}