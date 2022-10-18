import 'package:flutter/material.dart';
import 'fluro_router.dart';

void main() {
  runApp(MyApp());
  RouteFluro.setupRouter();
}


// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff3152b7), useMaterial3: true),
      initialRoute: '/',
      onGenerateRoute: RouteFluro.router.generator,
    );
  }
}

