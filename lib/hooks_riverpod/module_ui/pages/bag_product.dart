import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_managment/hooks_riverpod/module_ui/my_app.dart';

class BagProduct extends HookConsumerWidget {
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
                itemCount: bag.length, // сколько раз повторится цикл
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(bag[index].image)),
                      title: Text(bag[index].title),
                      subtitle: Text("${bag[index].amount.toString()}₽"),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(stateBagProvider.notifier)
                              .clearInBag(bag[index]);
                          ref
                              .read(stateProductProvider.notifier)
                              .inBag(bag[index]);
                        },
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
