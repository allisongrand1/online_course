import 'package:state_managment/bloc_stream-controller/module_data/model/model.dart';

abstract class ProductEvent {
  const ProductEvent();
}

class LoadingEvent extends ProductEvent {
  const LoadingEvent();
}

class LoadedEvent extends ProductEvent {
  const LoadedEvent();
}

class AddInBagEvent extends ProductEvent {
  final Product addProduct;

  const AddInBagEvent(this.addProduct);
}

class BagEvent extends ProductEvent {
  final List<Product> bagList;
  const BagEvent(this.bagList);
}

class InBagEvent extends ProductEvent {
  final List<Product> bagList;
  const InBagEvent(this.bagList);
}

class DeleteFromBagEvent extends ProductEvent {
  const DeleteFromBagEvent();
}
