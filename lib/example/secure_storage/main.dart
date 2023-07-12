import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  int _counter = 0;
  FlutterSecureStorage? storage;
  static const kCounterKey = 'counter';

  @override
  void initState() {
    super.initState();
    storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device));
    _initialize();
  }

  void _initialize() async {
    final counterValue = await storage!.read(key: kCounterKey);
    setState(() {
      _counter = int.parse(counterValue ?? '0');
    });
  }

  void _insertPerson() async {
    setState(() {
      _counter++;
    });

    storage?.write(key: kCounterKey, value: _counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text('$_counter')],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insertPerson();
        },
        tooltip: 'add',
        child: const Icon(Icons.abc),
      ),
    );
  }
}
