import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/four_task/helpers/adaprive_widget.dart';
import 'package:multiplatform_solutions/four_task/widget/big_screen.dart';
import 'package:multiplatform_solutions/four_task/widget/small_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AdaptiveWidget(
          bigScreen: BigScreen(),
          smallScreen: SmallScreen(),
        ),
      ),
    );
  }
}
