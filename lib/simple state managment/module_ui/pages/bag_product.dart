import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/simple%20state%20managment/module_data/product_repository.dart';

class BagProduct extends StatelessWidget {
  const BagProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Корзина"),
        ),
        body: Column(
          children: [
           Expanded(
            flex: 5,
              child: ListView.builder(
                itemCount: context
                    .watch<ProductRepository>()
                    .getBag
                    .length, // сколько раз повторится цикл
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(context
                            .watch<ProductRepository>()
                            .shoppingBag
                            .bagOfProduct[index]
                            .image)),
                    title: Text(context
                        .watch<ProductRepository>()
                        .shoppingBag
                        .bagOfProduct[index]
                        .title),
                    subtitle: Text(
                        "${context.watch<ProductRepository>().shoppingBag.bagOfProduct[index].amount.toString()}₽"),
                    trailing: IconButton(
                        onPressed: () => context.read<ProductRepository>().clearInBag(
                            Provider.of<ProductRepository>(context, listen: false)
                                .shoppingBag.bagOfProduct[index]),
                        icon: const Icon(Icons.clear),
                      )
                  );
                },
              ),
            ),
            Expanded(flex: 1, child: Text('${context
                        .watch<ProductRepository>().getSum
                        }₽')),
          ],
        ));
  }
}
