// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/cubit/module_data/model/model.dart';
import 'package:state_managment/flutter_bloc/cubit/module_data/product_repository.dart';
import 'package:state_managment/flutter_bloc/cubit/module_domain/cubit_state.dart';

ProductRepository _repository = ProductRepository();
List<Product> _products = _repository.getListProduct;
List<Product> _bag = _repository.getListInBag;
double sum = 0;

abstract class Cubits {}

class ProductCubit extends Cubit<ProductState> implements Cubits {
  ProductCubit() : super(LoadingState());

  void loadedProducts() {
    try {
      emit(LoadedState(_products));
    } catch (e) {
      addError(Exception('loadedProducts error!'), StackTrace.current);
    }
  }

  void addInBag(Product product) {
    product.isInBag = !product.isInBag;
    sum = sum + product.amount;
    _bag.add(product);
    emit(LoadedState(_products));
  }
}

class BagCubit extends Cubit<ProductState> implements Cubits {
  double get getSum => sum;

  BagCubit() : super(LoadingState());

  void loadedProducts() {
    try {
      emit(LoadedState(_bag));
    } catch (e) {
      addError(Exception('loadedProducts error!'), StackTrace.current);
    }
  }

  void deleteFromBag(Product product) {
    product.isInBag = !product.isInBag;
    _bag = _bag.where((element) => element.title != product.title).toList();
    sum = sum - product.amount;

    emit(LoadedState(_bag));
  }
}

class MyObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
