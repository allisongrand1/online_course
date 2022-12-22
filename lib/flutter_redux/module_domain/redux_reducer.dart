// ignore_for_file: avoid_print

import 'package:redux/redux.dart';
import 'package:state_managment/flutter_redux/module_data/model/model.dart';
import 'package:state_managment/flutter_redux/module_data/product_repository.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_action.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_state.dart';

ProductRepository repository = ProductRepository();
List<Product> products = repository.getListProduct;
List<Product>? bag = repository.getListInBag;
double sum = 0;

AppState reducer(AppState state, dynamic action) => AppState(
      listOfBag: _bagReducer(state.listOfBag, action),
      listOfProducts: state.listOfProducts,
      sumOfProducts: sum,
    );

Reducer<List<Product>> _bagReducer = combineReducers([
  TypedReducer<List<Product>, AddAction>(_addInBagReducer),
  TypedReducer<List<Product>, DeleteAction>(_deleteFromBagReducer),
]);

List<Product> _addInBagReducer(List<Product> state, AddAction action) {
  action.product.isInBag = true;
  sum = sum + action.product.amount;
  return bag = state..add(action.product);
}

List<Product> _deleteFromBagReducer(List<Product> state, DeleteAction action) {
  action.product.isInBag = false;
  sum = sum - action.product.amount;
  return bag =
      state.where((element) => element.title != action.product.title).toList();
}
