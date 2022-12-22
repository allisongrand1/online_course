import 'package:state_managment/flutter_mobx/module_data/list_product/list_product.dart';
import 'package:state_managment/flutter_mobx/module_data/model/model.dart';

abstract class Repository {}

class ProductRepository implements Repository {
  List<Product> get getListProduct => listOfProduct;
  set getListProduct(List<Product> val) => listOfProduct = val;

  List<Product> get getListInBag => bagOfProduct;
}
