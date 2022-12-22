import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_reducer.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_state.dart';
import 'package:state_managment/flutter_redux/module_ui/my_app.dart';

void main() {
  final store = Store<AppState>(reducer,
      initialState: AppState(
          listOfProducts: products, listOfBag: bag!, sumOfProducts: sum));

  runApp(MyApp(
    store: store,
  ));
}
