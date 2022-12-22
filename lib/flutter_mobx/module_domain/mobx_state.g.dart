// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExampleState on _ExampleState, Store {
  Computed<List<Product>>? _$listInHomeComputed;

  @override
  List<Product> get listInHome =>
      (_$listInHomeComputed ??= Computed<List<Product>>(() => super.listInHome,
              name: '_ExampleState.listInHome'))
          .value;
  Computed<List<Product>>? _$listInBagComputed;

  @override
  List<Product> get listInBag =>
      (_$listInBagComputed ??= Computed<List<Product>>(() => super.listInBag,
              name: '_ExampleState.listInBag'))
          .value;

  late final _$_repositoryAtom =
      Atom(name: '_ExampleState._repository', context: context);

  @override
  ProductRepository get _repository {
    _$_repositoryAtom.reportRead();
    return super._repository;
  }

  @override
  set _repository(ProductRepository value) {
    _$_repositoryAtom.reportWrite(value, super._repository, () {
      super._repository = value;
    });
  }

  late final _$sumAtom = Atom(name: '_ExampleState.sum', context: context);

  @override
  double get sum {
    _$sumAtom.reportRead();
    return super.sum;
  }

  @override
  set sum(double value) {
    _$sumAtom.reportWrite(value, super.sum, () {
      super.sum = value;
    });
  }

  late final _$_ExampleStateActionController =
      ActionController(name: '_ExampleState', context: context);

  @override
  void addInBag(Product product) {
    final _$actionInfo = _$_ExampleStateActionController.startAction(
        name: '_ExampleState.addInBag');
    try {
      return super.addInBag(product);
    } finally {
      _$_ExampleStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteFromBag(Product product) {
    final _$actionInfo = _$_ExampleStateActionController.startAction(
        name: '_ExampleState.deleteFromBag');
    try {
      return super.deleteFromBag(product);
    } finally {
      _$_ExampleStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sum: ${sum},
listInHome: ${listInHome},
listInBag: ${listInBag}
    ''';
  }
}
