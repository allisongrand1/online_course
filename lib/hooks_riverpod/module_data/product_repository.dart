import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/hooks_riverpod/module_data/lists/lists.dart';
import 'package:state_managment/hooks_riverpod/module_data/model/model.dart';

abstract class Lists {}

class ProductList extends StateNotifier<List<Product>> implements Lists {
  ProductList() : super(listOfProduct); //state
  void inBag(Product product) {
    product.isInBag = !product.isInBag;
    state = state
        .where((element) =>
            element.isInBag == product.isInBag ||
            element.isInBag != product.isInBag)
        .toList();
  }
}

class BagList extends StateNotifier<List<Product>> implements Lists {
  double sum = 0;

  BagList() : super(bagOfProduct); //state
  double get getSum => sum;

  void addInBag(Product product) {
    sum = sum + product.amount;
    state.add(product);
  }

  void clearInBag(Product product) {
    state = state.where((element) => element.title != product.title).toList();
    sum = sum - product.amount;
  }
}
