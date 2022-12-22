// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_data/model/model.dart';
import 'package:state_managment/flutter_bloc/bloc/module_data/product_repository.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc_event.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc_state.dart';

ProductRepository _repository = ProductRepository();
List<Product> _products = _repository.getListProduct;
List<Product> _bag = _repository.getListInBag;
double sum = 0;

abstract class Blocs {}

class ProductBloc extends Bloc<ProductEvent, ProductState> implements Blocs {
  ProductBloc() : super(LoadingState()) {
    on<LoadedEvent>((event, emit) {
      emit(LoadingState());
      try {
        emit(LoadedState(_products));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<AddInBagEvent>((event, emit) {
      var product = event.addProduct;
      product.isInBag = !product.isInBag;
      sum = sum + product.amount;
      _bag.add(product);
      emit(LoadedState(_products));
    });
  }
}

class BagBloc extends Bloc<ProductEvent, ProductState> implements Blocs {
  double get getSum => sum;

  BagBloc() : super(LoadingState()) {
    on<LoadedEvent>((event, emit) {
      emit(LoadingState());
      try {
        emit(LoadedState(_bag));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<DeleteInBagEvent>((event, emit) {
      var product = event.deleteProduct;
      product.isInBag = !product.isInBag;
      _bag = _bag.where((element) => element.title != product.title).toList();
      sum = sum - product.amount;

      emit(LoadedState(_bag));
    });
  }
}

class MyObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
