import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  late File file;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _initialize();
  }

  void saveProgress() {
    file.writeAsString(_controller.text);
  }

  void _initialize() async {
    final appDocDir = await getApplicationDocumentsDirectory();

    file = File('${appDocDir.path}/file_name.txt');

    if (await file.exists()) {
      _controller.text = await file.readAsString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(child: TextFormField()),
        ElevatedButton(onPressed: saveProgress, child: const Text('da')),
      ]),
    );
  }
}
