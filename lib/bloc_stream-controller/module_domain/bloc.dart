// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:state_managment/bloc_stream-controller/module_data/model/model.dart';
import 'package:state_managment/bloc_stream-controller/module_data/product_repository.dart';
import 'package:state_managment/bloc_stream-controller/module_domain/bloc_event.dart';

abstract class Bloc {
  void dispose() {}
}

/* enum ColorEvent { event_red, event_green } */

class ProductBloc implements Bloc {
  ProductRepository repository = ProductRepository();
  BagBloc blocBag = BagBloc();

  late List<Product> products = repository.getListProduct;
  late List<Product> bag = repository.getListInBag;

  final _eventController = StreamController<ProductEvent>();
  final _stateController = StreamController<dynamic>();

  StreamSink<ProductEvent> get eventSink => _eventController.sink;
  Stream<dynamic> get stateStream => _stateController.stream;

  void _mapEventToState(event) {
    if (event is LoadingEvent) {
      _stateController.sink.add(const CircularProgressIndicator());
      _eventController.sink.add(const LoadedEvent());
    } else if (event is LoadedEvent) {
      _stateController.sink.add(products);
    } else if (event is AddInBagEvent) {
      var product = event.addProduct;
      product.isInBag = true;
      bag.add(product);
      print("добавлен в корзину $bag");
      _stateController.sink.add(products);
    } else if (event is InBagEvent) {
      blocBag._eventController.sink.add(BagEvent(bag));
    } else {
      throw Exception('Wrong Event');
    }
  }

  ProductBloc() {
    _eventController.sink.add(const LoadingEvent());
    _eventController.stream.listen(_mapEventToState);
  }

  @override
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}

class BagBloc implements Bloc {
  ProductRepository repository = ProductRepository();
  late List<Product> bag = repository.getListInBag;

  final _eventController = StreamController<ProductEvent>.broadcast();
  final _stateController = StreamController<dynamic>.broadcast();

  StreamSink<ProductEvent> get eventSink => _eventController.sink;
  Stream<dynamic> get stateStream => _stateController.stream;

  void _mapEventToState(event) {
    if (event is BagEvent) {
      bag = event.bagList;
      _eventController.sink.add(const LoadedEvent());
    } else if (event is LoadedEvent) {
      print("В корзине находится $bag");
      _stateController.sink.add(bag);
    } else if (event is DeleteFromBagEvent) {
    } else {
      throw Exception('Wrong Event');
    }
  }

  BagBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  @override
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
