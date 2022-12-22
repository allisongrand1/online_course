import 'package:flutter/material.dart';

import 'lists/lists.dart';
import 'model/model.dart';

abstract class Lists {}

class ProductList with ChangeNotifier implements Lists {
  final ProductProvider _products = ProductProvider();
  final BagProvider _shoppingBag = BagProvider();
  double sum = 0;

  List<Product> get getList => _products.listOfProduct;
  List<Product> get getBag => _shoppingBag.bagOfProduct;
  double get getSum => sum;

  void addInBag(Product product) {
    _shoppingBag.bagOfProduct.add(product);
    product.isInBag = true;
    sum = sum + product.amount;
    notifyListeners();
  }

  void clearInBag(Product product) {
    _shoppingBag.bagOfProduct.remove(product);
    product.isInBag = false;
    sum = sum - product.amount;
    notifyListeners();
  }
}
