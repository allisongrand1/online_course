// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/cubit/module_domain/cubit.dart';
import 'package:state_managment/flutter_bloc/cubit/module_domain/cubit_state.dart';

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
                BlocProvider.of<BagCubit>(context).loadedProducts();
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
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
                  subtitle:
                      Text("${state.listOfProduct[index].amount.toString()}₽"),
                  trailing: IconButton(
                    onPressed: () {
                      context
                          .read<ProductCubit>()
                          .addInBag(state.listOfProduct[index]);
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
    );
  }
}
