import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/third_task/home_page.dart';

class ThirdTask extends StatelessWidget {
  const ThirdTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowWebsiteWithPlatform(),
    );
  }
}
