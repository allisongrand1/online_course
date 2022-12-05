import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/flutter_riverpod/module_data/list_product/list_product.dart';
import 'package:state_managment/flutter_riverpod/module_data/model/model.dart';
import 'package:state_managment/flutter_riverpod/module_data/shopping_bag.dart/shopping_bag.dart';

abstract class Repository {}

class ProductRepository extends StateNotifier<ProductProvider>
    implements Repository {
  ProductRepository() : super(ProductProvider()); //state

  /*  void addInBag(Product product) {
    /* shoppingBag.bagOfProduct.add(product);
    product.isInBag = true;
    sum = sum + product.amount; */
   
  }

  void clearInBag(Product product){
    /* shoppingBag.bagOfProduct.remove(product);
    product.isInBag = false;
    sum = sum - product.amount; */
     
  } */
}

class BagRepository extends StateNotifier<BagProvider> implements Repository {
  double sum = 0;

  BagRepository() : super(BagProvider()); //state
  double get getSum => sum;

  void addInBag(Product product) {
    state.bagOfProduct.add(product);
    product.isInBag = true;
    sum = sum + product.amount;
  }

  void clearInBag(Product product) {
    state.bagOfProduct.remove(product);
    product.isInBag = false;
    sum = sum - product.amount;
  }
}
