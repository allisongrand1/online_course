import 'package:state_managment/flutter_redux/module_data/model/model.dart';

class AddAction {
  final Product product;

  AddAction(this.product);
}

class DeleteAction {
  final Product product;

  DeleteAction(this.product);
}
