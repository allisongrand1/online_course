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
        body: Consumer<ProductList>(
            builder: (context, state, child) => ListView.builder(
                  itemCount: context
                      .watch<ProductList>()
                      .getList
                      .length, // сколько раз повторится цикл
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: Consumer<ProductList>(
                                builder: (context, state, child) =>
                                    Image.network(context
                                        .watch<ProductList>()
                                        .getList[index]
                                        .image))),
                        title: Consumer<ProductList>(
                            builder: (context, state, child) => Text(context
                                .watch<ProductList>()
                                .getList[index]
                                .title)),
                        subtitle: Consumer<ProductList>(
                            builder: (context, state, child) => Text(
                                "${context.watch<ProductList>().getList[index].amount.toString()}₽")),
                        trailing: Consumer<ProductList>(
                            builder: (context, state, child) => IconButton(
                                  onPressed: () => context
                                      .read<ProductList>()
                                      .addInBag(Provider.of<ProductList>(
                                              context,
                                              listen: false)
                                          .getList[index]),
                                  icon: context
                                          .watch<ProductList>()
                                          .getList[index]
                                          .isInBag
                                      ? const Icon(Icons.done)
                                      : const Icon(Icons.add),
                                )));
                  },
                )));
  }
}
