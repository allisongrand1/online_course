import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: YandexMap(mapObjects: [
          MapObjectCollection(
            mapId: MapObjectId('polygon'),
            mapObjects: [
              PlacemarkMapObject(
                  mapId: MapObjectId('placemark'),
                  point: Point(latitude: 59.945933, longitude: 30.320045)),
            ],
          )
        ]));
  }
}
