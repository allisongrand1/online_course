import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/flutter_riverpod/module_ui/pages/home_page.dart';

class BagProduct extends ConsumerWidget {
  const BagProduct({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bag = ref.watch(stateBagProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Корзина"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount:
                    bag.bagOfProduct.length, // сколько раз повторится цикл
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(bag.bagOfProduct[index].image)),
                      title: Text(bag.bagOfProduct[index].title),
                      subtitle:
                          Text("${bag.bagOfProduct[index].amount.toString()}₽"),
                      trailing: IconButton(
                        onPressed: () => ref
                            .read(stateBagProvider.notifier)
                            .clearInBag(bag.bagOfProduct[index]),
                        icon: const Icon(Icons.clear),
                      ));
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: Text('${ref.watch(stateBagProvider.notifier).getSum}₽')),
          ],
        ));
  }
}
