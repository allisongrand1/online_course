// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_data/model/model.dart';
import 'package:state_managment/flutter_bloc/bloc/module_data/product_repository.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc_event.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc_state.dart';

ProductRepository repository = ProductRepository();
List<Product> products = repository.getListProduct;
List<Product> bag = repository.getListInBag;

abstract class Blocs {}

class ProductBloc extends Bloc<ProductEvent, ProductState> implements Blocs {
  /* ProductRepository repository = ProductRepository();
  late List<Product> products = repository.getListProduct;
  late List<Product> bag = repository.getListInBag; */

  ProductBloc() : super(LoadingState()) {
    on<LoadedEvent>((event, emit) {
      emit(LoadingState());
      try {
        emit(LoadedState(products));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<AddInBagEvent>((event, emit) {
      var product = event.addProduct;
      product.isInBag = true;
      bag.add(product);
      print(bag);
      emit(LoadedState(products));
    });
  }
}

class BagBloc extends Bloc<ProductEvent, ProductState> implements Blocs {
  /* ProductRepository repository = ProductRepository();
  late List<Product> products = repository.getListProduct;
  late List<Product> bag = repository.getListInBag;
 */
  BagBloc() : super(LoadingState()) {
    on<LoadedEvent>((event, emit) {
      emit(LoadingState());
      try {
        emit(LoadedState(bag));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<DeleteInBagEvent>((event, emit) {
      var product = event.deleteProduct;

      products.map((e) {
        if (e == product) return product.isInBag = false;
      });
      bag.remove(product);
      emit(LoadedState(bag));
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
