import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/first_second_tasks/home_page.dart';

class FirstAndSecondTask extends StatelessWidget {
  const FirstAndSecondTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowWebsite(),
    );
  }
}
