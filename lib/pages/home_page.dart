import 'package:flutter/material.dart';

import '../space.dart';
import 'detail_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Animation')),
      ),
      body: ListView(
        children: spaces
            .map(
              (space) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailView(data: space)));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(
                          tag: space.id,
                          child: SizedBox(
                            height: 100,
                            child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20)),
                                child: Image.asset(
                                  space.image,
                                  fit: BoxFit.cover,
                                )),
                          )),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Hero(
                              tag: '${space.id}-title',
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  height: 50,
                                  child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        space.description,
                                        overflow: TextOverflow.ellipsis,
                                      )))),
                          Positioned(
                            top: -20,
                            right: 20,
                            child: Hero(
                                tag: '${space.id}-button',
                                child: Material(
                                    child: Container(
                                        color:
                                            const Color.fromARGB(185, 64, 125, 160),
                                        padding: const EdgeInsets.all(4),
                                        child: const Icon(Icons.play_arrow)))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
