import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/flutter_riverpod/module_data/list_product/list_product.dart';
import 'package:state_managment/flutter_riverpod/module_data/model/model.dart';

abstract class Repository {}

class ProductRepository extends StateNotifier<ProductProvider>
    implements Repository {
  ProductRepository() : super(ProductProvider()); //state
  bool isBag = false;
}

class BagRepository extends StateNotifier<List<Product>> implements Repository {
  double sum = 0;
  bool isBag = false;

  BagRepository([List<Product>? initialBag]) : super(initialBag ?? []); //state
  double get getSum => sum;

  void addInBag(Product product) {
    state.add(product);
    isBag = true;
    sum = sum + product.amount;
  }

  void clearInBag(Product product) {
    state = state.where((element) => element.title != product.title).toList();
    sum = sum - product.amount;
  }
}
