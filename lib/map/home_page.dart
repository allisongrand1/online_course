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
  double _value = 15;
  final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
  static const Point point = Point(latitude: 59.945933, longitude: 30.320045);

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
        appBar: AppBar(
          foregroundColor: Colors.blueGrey,
          backgroundColor: Colors.white,
        ),
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
          SizedBox(
            height: 50,
            width: 200,
            child: Slider(
              activeColor: Colors.blueGrey,
              value: _value,
              min: 0,
              max: 25,
              onChanged: (double value) {
                setState(() {
                  mapControllerCompleter
                      .moveCamera(CameraUpdate.zoomTo(_value));
                  _value = value;
                });
              },
            ),
          ),
          Positioned(
            right: 0,
            bottom: 80,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blueGrey,
                          backgroundColor: Colors.white),
                      onPressed: () {
                        setState(() {
                          _value++;
                          mapControllerCompleter.moveCamera(
                              CameraUpdate.zoomTo(_value),
                              animation: const MapAnimation(
                                  type: MapAnimationType.linear,
                                  duration: 1.0));
                        });
                      },
                      child: const Icon(Icons.add)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blueGrey,
                          backgroundColor: Colors.white),
                      onPressed: () {
                        {
                          setState(() {
                            _value--;
                            mapControllerCompleter.moveCamera(
                                CameraUpdate.zoomTo(_value),
                                animation: const MapAnimation(
                                    type: MapAnimationType.linear,
                                    duration: 1.0));
                          });
                        }
                      },
                      child: const Icon(Icons.remove)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                foregroundColor: Colors.blueGrey,
                backgroundColor: Colors.white,
                child: const Icon(Icons.home),
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
