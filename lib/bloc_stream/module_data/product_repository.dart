import 'package:state_managment/bloc_stream/module_data/list_product/list_product.dart';
import 'package:state_managment/bloc_stream/module_data/model/model.dart';

abstract class Repository {}

class ProductRepository implements Repository {
  List<Product> get getListProduct => listOfProduct;
  List<Product> get getListInBag => bagOfProduct;
}
