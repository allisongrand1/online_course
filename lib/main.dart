import 'package:flutter/material.dart';
import 'package:hotels/views/home_view.dart';
import 'package:fluro/fluro.dart';
import 'fluro_router.dart';
import 'views/hotel_page.dart';

void main() {
  runApp(MyApp());
  RouteFluro.setupRouter();
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Color(0xff3152b7), useMaterial3: true),
      initialRoute: '/',
      onGenerateRoute: RouteFluro.router.generator,
    );
  }
}

