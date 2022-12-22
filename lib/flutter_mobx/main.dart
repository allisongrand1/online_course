import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/flutter_mobx/module_domain/mobx_state.dart';
import 'package:state_managment/flutter_mobx/module_ui/my_app.dart';

void main() {
  runApp(Provider(
      create: (BuildContext context) => ExampleState(), child: const MyApp()));
}
