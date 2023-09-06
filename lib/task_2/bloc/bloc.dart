import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presistance_data/task_2/bloc/event.dart';
import 'package:presistance_data/task_2/bloc/state.dart';

class MainBloc extends Bloc<Event, MainState> {
  MainBloc() : super(InitialMainState()) {
    /* late File file;
    final appDocDir = getApplicationDocumentsDirectory()
        .then((value) => file = File(value.path));
 */
    /*  on<InitialEvent>((event, emit) async {
      final appDocDir = await getApplicationDocumentsDirectory();

      file = File(appDocDir.path);

      /*  if (await file.exists()) {
        _controller.text = await file.readAsString();
      } */
    }); */

    on<DownloadEvent>((event, emit) async {
      emit(LoadingMainState());
      Future<List<Image>> listOfPic = Future.value([]);

      Image? image = Image.memory(event.file.readAsBytesSync());
      listOfPic.then((value) => value.add(image));

      emit(LoadedMainState(listOfPic));
    });

    on<SaveEvent>((event, emit) async {
      emit(LoadingMainState());

      var url = event.text;
      var response = await http.get(Uri.parse(url));
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      event.file = File(join(documentDirectory.path, url.split('/').last));
      event.file.writeAsBytes(response.bodyBytes);
    });
  }
}
