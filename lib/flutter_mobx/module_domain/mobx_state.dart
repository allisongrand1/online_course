// ignore_for_file: prefer_final_fields

import 'package:mobx/mobx.dart';
import 'package:state_managment/flutter_mobx/module_data/model/model.dart';
import 'package:state_managment/flutter_mobx/module_data/product_repository.dart';

part 'mobx_state.g.dart';

// ignore: library_private_types_in_public_api
class ExampleState = _ExampleState with _$ExampleState;

abstract class _ExampleState with Store {
  @observable
  ProductRepository _repository = ProductRepository();

  @computed
  List<Product> get listInHome => _repository.getListProduct;

  @computed
  List<Product> get listInBag => _repository.getListInBag;

  @observable
  double sum = 0;

  @action
  void addInBag(Product product) {
    product.isInBag = true;
    _repository.getListProduct = _repository.getListProduct
        .where((element) =>
            element.isInBag == product.isInBag ||
            element.isInBag != product.isInBag)
        .toList();
    sum = sum + product.amount;
    _repository.getListInBag.add(product);
  }

  @action
  void deleteFromBag(Product product) {
    product.isInBag = false;

    sum = sum - product.amount;
    _repository.getListInBag.remove(product);
  }
}
