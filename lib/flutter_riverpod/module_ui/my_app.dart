import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/flutter_riverpod/module_data/list_product/list_product.dart';
import 'package:state_managment/flutter_riverpod/module_data/model/model.dart';
import 'package:state_managment/flutter_riverpod/module_data/product_repository.dart';
import 'package:state_managment/flutter_riverpod/module_ui/pages/bag_product.dart';
import 'package:state_managment/flutter_riverpod/module_ui/pages/home_page.dart';

import '../../theme/theme.dart';

final stateProductProvider =
    StateNotifierProvider<ProductRepository, ProductProvider>(
        (ref) => ProductRepository());
final stateBagProvider = StateNotifierProvider<BagRepository, List<Product>>(
    (ref) => BagRepository());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: basicTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ShopPage(),
        '/bag': (context) => const BagProduct(),
      },
    );
  }
}
