import 'package:flutter/material.dart';

abstract class MainState {}

class InitialMainState extends MainState {}

class LoadingMainState extends MainState {}

class LoadedMainState extends MainState {
  final Future<List<Image>> images;

  LoadedMainState(this.images);
}
