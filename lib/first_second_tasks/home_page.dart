// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowWebsite extends StatefulWidget {
  const ShowWebsite({super.key});

  @override
  State<ShowWebsite> createState() => _ShowWebsiteState();
}

class _ShowWebsiteState extends State<ShowWebsite> {
  Future<String> findWebsite(String website) async {
    final response = await http.get(
      Uri.parse(website),
    );
    return response.body;
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ListView(
                children: [
                  FutureBuilder<String>(
                    future: findWebsite(controller.text),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListTile(title: Text(snapshot.data));
                      }
                      if (snapshot.connectionState == ConnectionState.active) {
                        return const SafeArea(
                            child: Text('ConnectionState.active'));
                      }
                      return const Text('data');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    onChanged: (_) => setState(() {
                      print(controller.text);
                    }),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintText: 'Введите значение',
                        suffixIcon: Container(
                          width: 100,
                          height: 60,
                          color: Colors.black,
                          child: TextButton(
                            onPressed: () {
                              return setState(() {
                                print(controller.text);
                              });
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white),
                            child: const Text('Найти'),
                          ),
                        )),
                    controller: controller,
                  ),
                  (kIsWeb)
                      ? const Text('Application running on Web')
                      : Text(
                          "Application running on ${Platform.operatingSystem}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
