import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/simple%20state%20managment/module_data/product_repository.dart';
import 'package:state_managment/simple%20state%20managment/module_ui/pages/bag_product.dart';
import 'package:state_managment/simple%20state%20managment/module_ui/pages/home_page.dart';

import '../../theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductList>(
        create: (BuildContext context) => ProductList(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: basicTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const ShopPage(),
            '/bag': (context) => const BagProduct(),
          },
        ));
  }
}
