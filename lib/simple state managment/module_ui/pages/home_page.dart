import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/simple%20state%20managment/module_data/product_repository.dart';

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
        body: Consumer<ProductRepository>(
                        builder: (context, state, child) =>ListView.builder(
          itemCount: context
              .watch<ProductRepository>()
              .getList
              .length, // сколько раз повторится цикл
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Consumer<ProductRepository>(
                        builder: (context, state, child) => Image.network(
                            context
                                .watch<ProductRepository>()
                                .products
                                .listOfProduct[index]
                                .image))),
                title: Consumer<ProductRepository>(
                        builder: (context, state, child) =>Text(context
                    .watch<ProductRepository>()
                    .products
                    .listOfProduct[index]
                    .title)),
                subtitle: Consumer<ProductRepository>(
                        builder: (context, state, child) =>Text(
                    "${context.watch<ProductRepository>().products.listOfProduct[index].amount.toString()}₽")),
                trailing: Consumer<ProductRepository>(
                        builder: (context, state, child) =>IconButton(
                  onPressed: () => context.read<ProductRepository>().addInBag(
                      Provider.of<ProductRepository>(context, listen: false)
                          .products
                          .listOfProduct[index]),
                  icon: context
                          .watch<ProductRepository>()
                          .products
                          .listOfProduct[index]
                          .isInBag
                      ? const Icon(Icons.done)
                      : const Icon(Icons.add),
                )));
          },
        )));
  }
}
