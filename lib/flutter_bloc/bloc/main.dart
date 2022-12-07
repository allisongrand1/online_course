import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_domain/bloc.dart';
import 'package:state_managment/flutter_bloc/bloc/module_ui/my_app.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}
