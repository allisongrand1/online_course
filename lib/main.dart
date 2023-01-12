import 'package:advanced_widget/theme/theme.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Widget',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: DataWidget(data: Data(), child: const HomePage()),
    );
  }
}

class DataWidget extends InheritedWidget {
  final Data data;
  const DataWidget({super.key, required this.data, required Widget child})
      : super(child: child);

  static Data of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<DataWidget>();
    assert(result != null, 'No DataWidget found in context');
    return result!.data;
  }

  @override
  bool updateShouldNotify(DataWidget oldWidget) => data != oldWidget.data;
}

class Data {
  double number;
  int degree;
  Data({this.number = 0.0, this.degree = 20});
}
