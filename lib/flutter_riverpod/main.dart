import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/flutter_riverpod/module_ui/my_app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
