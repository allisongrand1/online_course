import 'package:state_managment/flutter_redux/module_data/model/model.dart';

class AppState {
  final List<Product> listOfProducts;
  final List<Product> listOfBag;
  final double sumOfProducts;

  AppState(
      {required this.listOfBag,
      required this.listOfProducts,
      required this.sumOfProducts});
}
