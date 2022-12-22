import 'dart:async';
import 'package:state_managment/bloc_stream/module_data/model/model.dart';
import 'package:state_managment/bloc_stream/module_data/product_repository.dart';

ProductRepository _repository = ProductRepository();
List<Product> products = _repository.getListProduct;
List<Product> listBag = _repository.getListInBag;

class ProductBLoC {
  //это стрим и контроллер для списка на домашней странице
  Stream<List<Product>> get productsList async* {
    yield ProductRepository().getListProduct;
  }

  final StreamController<int> _homeController = StreamController<int>();

//это стрим и контроллер для списка в корзине
  Stream<List<Product>> get bagList async* {
    yield ProductRepository().getListInBag;
  }

  final StreamController<List<Product>> _bagController =
      StreamController<List<Product>>();

  //это контроллер для обработки действий на домашней странице,
  //то есть мы отправляем в этот контроллер значения из кнопки "+"
  StreamController<Product> _addController = StreamController<Product>();
  StreamSink<Product> get addInBag => _addController.sink;

  //это контроллер для обработки действий в корзине,
  //то есть мы отправляем в этот контроллер значения из кнопки "х"
  StreamController<Product> _deleteController = StreamController<Product>();
  StreamSink<Product> get deleteFromBag => _deleteController.sink;

  ProductBLoC() {
    productsList.listen((list) => _homeController.add(list.length));
    bagList.listen((list) => _bagController.add(list));
    _addController.stream.listen(_addLogic);
    _deleteController.stream.listen(_deleteLogic);
  }

  //в этом методе значения, которые мы отловили в контроллере _addController мы
  //добавляем в список корзины и отправляем этот список в контроллер _bagController
  void _addLogic(Product product) {
    listBag.add(product);
    _bagController.add(listBag);
  }

  //в этом методе значения, которые мы отловили в контроллере _deleteController мы
  //удаляем из списка корзины и отправляем этот список в контроллер _bagController
  void _deleteLogic(Product product) {
    listBag.where((element) => element.title != product.title).toList();
    _bagController.add(listBag);
  }

  void dispose() {
    _addController.close();
    _deleteController.close();
    _bagController.close();
    _homeController.close();
  }
}
