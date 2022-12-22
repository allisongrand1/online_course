import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_managment/flutter_redux/module_domain/redux_state.dart';
import 'package:state_managment/flutter_redux/module_ui/pages/bag_product.dart';
import 'package:state_managment/flutter_redux/module_ui/pages/home_page.dart';
import 'package:state_managment/theme/theme.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
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
