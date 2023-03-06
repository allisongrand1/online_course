import 'dart:convert';

import 'package:devtools_flutter/task_1/module_data/model.dart';
import 'package:devtools_flutter/task_1/module_ui/list_activist.dart';
import 'package:devtools_flutter/task_1/module_ui/list_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;

  List<User> studentsList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/students.json');
    final List users = await json.decode(response) as List;

    setState(() {
      studentsList = users.map((user) => User.fromJson(user)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 1"),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListStudents(list: studentsList),
          ListActivist(list: studentsList),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (index) {
          setState(() {
            tabController.index = index;
            currentTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Activist'),
        ],
      ),
    );
  }
}
