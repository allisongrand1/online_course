import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presistance_data/task_2/bloc/bloc.dart';
import 'package:presistance_data/task_2/bloc/event.dart';
import 'package:presistance_data/task_2/bloc/state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  late File file;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _initialize();
  }

  void _initialize() async {
    final appDocDir = await getApplicationDocumentsDirectory();

    file = File(appDocDir.path);

    if (await file.exists()) {
      _controller.text = await file.readAsString();
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MainBloc>(context).add(DownloadEvent(file));
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          if (state is InitialMainState) {
            return Center(
              child: Text('Нет данных'),
            );
          } else if (state is LoadingMainState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedMainState) {
            return Column(
              children: [
                Expanded(
                    child: FutureBuilder<List<Image>>(
                  future: state.images,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: snapshot.data![index],
                            );
                          });
                    }
                    return const Center(
                      child: Text('Данные загружаются...'),
                    );
                  },
                )),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        suffix: IconButton(
                            onPressed: () {
                              context
                                  .read<MainBloc>()
                                  .add(SaveEvent(_controller.text, file));
                              context.read<MainBloc>().add(DownloadEvent(file));
                            },
                            icon: const Icon(Icons.add))),
                  ),
                ),
              ],
            );
          }
          return Container();
        }));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
