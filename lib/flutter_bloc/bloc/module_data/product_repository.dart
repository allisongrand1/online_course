import 'package:state_managment/flutter_bloc/bloc/module_data/list_product/list_product.dart';
import 'package:state_managment/flutter_bloc/bloc/module_data/model/model.dart';

abstract class Repository {}

class ProductRepository implements Repository {
  final ProductProvider _productProvider = ProductProvider();
  final BagProvider _bagProvider = BagProvider();

  List<Product> get getListProduct => _productProvider.listOfProduct;
  List<Product> get getListInBag => _bagProvider.bagOfProduct;
}

class ProductModel {
  late List model;

  ProductModel();

  ProductModel.fromDomain(List product) {
    model = product;
  }
}
