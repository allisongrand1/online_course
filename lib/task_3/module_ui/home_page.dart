import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  List<MemoryLeakObject> leakObjects = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text(
            'Создаем тысячу объектов',
          ),
          onPressed: () {
            while (leakObjects.length < 1000000) {
              leakObjects.add(
                MemoryLeakObject('Число: ${leakObjects.length}'),
              );
            }
          },
        ),
      ),
    );
  }
}

class MemoryLeakObject {
  final String text;

  MemoryLeakObject(this.text);
}
