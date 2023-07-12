import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _controller;
  Future<List<Image>> listOfPic = Future.value([]);
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

  Future<List<Image>> _showPicture() async {
    Image? image = Image.memory(file.readAsBytesSync());
    listOfPic.then((value) => value.add(image));

    return await listOfPic;
  }

  void savePtogress() async {
    var url = _controller.text;
    var response = await http.get(Uri.parse(url));
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    file = File(join(documentDirectory.path, url.split('/').last));
    file.writeAsBytes(response.bodyBytes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<List<Image>>(
              future: _showPicture(),
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
                  child: Text('Нет данных'),
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
                          savePtogress();
                        },
                        icon: const Icon(Icons.add))),
              ),
            ),
          ],
        ));
  }
}
