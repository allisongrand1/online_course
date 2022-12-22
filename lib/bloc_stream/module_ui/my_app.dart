import 'package:flutter/material.dart';
import 'package:state_managment/bloc_stream/module_ui/pages/bag_page.dart';
import 'package:state_managment/bloc_stream/module_ui/pages/home_page.dart';
import 'package:state_managment/theme/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: basicTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/bag': (context) => const BagProduct(),
      },
    );
  }
}
