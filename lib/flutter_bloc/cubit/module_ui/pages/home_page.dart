// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/cubit/module_domain/bloc.dart';
import 'package:state_managment/flutter_bloc/cubit/module_domain/bloc_event.dart';
import 'package:state_managment/flutter_bloc/cubit/module_domain/bloc_state.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  ProductBloc bloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(const LoadedEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Магазин"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/bag');
                  print("Передаем список в корзину через событие${bloc.bag}");
                  /*  bloc.eventSink.add(InBagEvent(bloc.bag));  */
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          print(state);
          print('Дом ${bloc.products}');
          if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.listOfProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(state.listOfProduct[index].image)),
                    title: Text(state.listOfProduct[index].title),
                    subtitle: Text(
                        "${state.listOfProduct[index].amount.toString()}₽"),
                    trailing: IconButton(
                      onPressed: () {
                        context
                            .read<ProductBloc>()
                            .add(AddInBagEvent(state.listOfProduct[index]));
                      },
                      icon: state.listOfProduct[index].isInBag
                          ? const Icon(Icons.done)
                          : const Icon(Icons.add),
                    ));
              },
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.message));
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        }),
      ),
    );
  }
}
