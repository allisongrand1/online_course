import 'package:state_managment/flutter_bloc/bloc/module_data/model/model.dart';

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

class DeleteInBagEvent extends ProductEvent {
  final Product deleteProduct;

  const DeleteInBagEvent(this.deleteProduct);
}
