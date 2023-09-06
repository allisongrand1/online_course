import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presistance_data/task_2/bloc/bloc.dart';
import 'package:presistance_data/task_2/bloc/event.dart';
import 'package:presistance_data/task_2/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Task1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
          child: MyHomePage(),
        ));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
