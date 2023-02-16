import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late YandexMapController mapControllerCompleter;
  final List<MapObject> mapObjects = [];
  double _value = 5;
  final MapObjectId targetMapObjectId = MapObjectId('target_placemark');
  static final Point point = Point(latitude: 59.945933, longitude: 30.320045);

  @override
  void initState() {
    super.initState();
    final placemark = PlacemarkMapObject(
        mapId: targetMapObjectId,
        point: point,
        opacity: 0.7,
        direction: 1,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage("assets/img/place.png"))));

    setState(() {
      mapObjects.add(placemark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          YandexMap(
            mapObjects: mapObjects,
            onMapCreated: (YandexMapController yandexMapController) async {
              mapControllerCompleter = yandexMapController;
              mapControllerCompleter.moveCamera(
                animation: const MapAnimation(
                    type: MapAnimationType.linear, duration: 1),
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: Point(
                      latitude: point.latitude,
                      longitude: point.longitude,
                    ),
                    zoom: 15,
                  ),
                ),
              );
            },
            onMapTap: (Point point) async {
              await mapControllerCompleter.deselectGeoObject();
            },
            onObjectTap: (GeoObject geoObject) async {
              if (geoObject.selectionMetadata != null) {
                await mapControllerCompleter.selectGeoObject(
                    geoObject.selectionMetadata!.id,
                    geoObject.selectionMetadata!.layerId);
              }
            },
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      await mapControllerCompleter.moveCamera(
                          CameraUpdate.zoomIn(),
                          animation: MapAnimation(
                              type: MapAnimationType.linear, duration: 1.0));
                    },
                    child: Icon(Icons.add)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      await mapControllerCompleter.moveCamera(
                          CameraUpdate.zoomOut(),
                          animation: MapAnimation(
                              type: MapAnimationType.linear, duration: 1.0));
                    },
                    child: Icon(Icons.remove)),
              ),
              Container(
                height: 50,
                child: Slider(
                  value: _value,
                  min: 1.0,
                  max: 10.0,
                  divisions: 10,
                  onChanged: (double value) {
                    setState(() {
                      if (value > _value) {
                        _value = value;
                        mapControllerCompleter.moveCamera(CameraUpdate.zoomIn(),
                            animation: MapAnimation(
                                type: MapAnimationType.linear, duration: 1.0));
                      } else {
                        _value = value;
                        mapControllerCompleter.moveCamera(
                            CameraUpdate.zoomOut(),
                            animation: MapAnimation(
                                type: MapAnimationType.linear, duration: 1.0));
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                child: Icon(Icons.home),
                onPressed: () {
                  mapControllerCompleter.moveCamera(
                      animation: const MapAnimation(
                          type: MapAnimationType.linear, duration: 1),
                      CameraUpdate.newCameraPosition(CameraPosition(
                        target: Point(
                          latitude: point.latitude,
                          longitude: point.longitude,
                        ),
                        zoom: 15,
                      )));
                },
              ),
            ),
          )
        ]));
  }
}
