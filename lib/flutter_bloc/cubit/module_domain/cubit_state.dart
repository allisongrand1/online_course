import 'package:state_managment/flutter_bloc/cubit/module_data/model/model.dart';

abstract class ProductState {}

class LoadingState implements ProductState {}

class LoadedState implements ProductState {
  final List<Product> listOfProduct;
  LoadedState(this.listOfProduct);
}

class AddInBagState implements ProductState {
  final List<Product> listOfProduct;
  AddInBagState(this.listOfProduct);
}

class ErrorState implements ProductState {
  final String message;
  ErrorState(this.message);
}
