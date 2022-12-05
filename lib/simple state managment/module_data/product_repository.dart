
import 'package:flutter/material.dart';
import 'package:state_managment/simple%20state%20managment/module_data/shopping_bag.dart/shopping_bag.dart';

import 'list_product/list_product.dart';
import 'model/model.dart';

abstract class Repository {}

class ProductRepository with ChangeNotifier implements Repository {
  ProductProvider products = ProductProvider();
  BagProvider shoppingBag = BagProvider();
  double sum = 0;

  List<Product> get getList => products.listOfProduct;
  List<Product> get getBag => shoppingBag.bagOfProduct;
  double get getSum => sum;

  void addInBag(Product product) {
    shoppingBag.bagOfProduct.add(product);
    product.isInBag = true;
    sum = sum + product.amount;
    notifyListeners();
  }

  void clearInBag(Product product){
    shoppingBag.bagOfProduct.remove(product);
    product.isInBag = false;
    sum = sum - product.amount;
     notifyListeners();
  }
}

