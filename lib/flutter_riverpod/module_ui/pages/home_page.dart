import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/flutter_riverpod/module_ui/my_app.dart';

class ShopPage extends ConsumerWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final product = ref.watch(stateProductProvider);
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
        body: ListView.builder(
          itemCount:
              product.listOfProduct.length, // сколько раз повторится цикл
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(product.listOfProduct[index].image)),
                title: Text(product.listOfProduct[index].title),
                subtitle:
                    Text("${product.listOfProduct[index].amount.toString()}₽"),
                trailing: IconButton(
                  onPressed: () => ref
                      .read(stateBagProvider.notifier)
                      .addInBag(product.listOfProduct[index]),
                  icon: ref.watch(stateBagProvider.notifier).isBag
                      ? const Icon(Icons.done)
                      : const Icon(Icons.add),
                ));
          },
        ));
  }
}
