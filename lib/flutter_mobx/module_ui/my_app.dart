import 'package:flutter/material.dart';
import 'package:state_managment/flutter_mobx/module_ui/pages/bag_product.dart';
import 'package:state_managment/flutter_mobx/module_ui/pages/home_page.dart';
import 'package:state_managment/theme/theme.dart';

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