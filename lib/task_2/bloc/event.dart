import 'dart:io';

import 'package:flutter/material.dart';

abstract class Event {}

class InitialEvent extends Event {}

class DownloadEvent extends Event {
  final File file;
  DownloadEvent(this.file);
}

class SaveEvent extends Event {
  final String text;
  File file;
  SaveEvent(this.text, this.file);
}
