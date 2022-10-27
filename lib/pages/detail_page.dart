import 'package:flutter/material.dart';

import '../space.dart';

class DetailView extends StatelessWidget {
  final Space data;
  const DetailView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: data.id, child: Image.asset(data.image)),
            Stack(clipBehavior: Clip.none, children: [
              Hero(
                  tag: '${data.id}-title',
                  child: Material(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Text(data.description),
                  ))),
              Positioned(
                top: -20,
                right: 20,
                child: Hero(
                    tag: '${data.id}-button',
                    child: Material(
                        child: Container(
                            color: const Color.fromARGB(185, 64, 125, 160),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(Icons.play_arrow)))),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
