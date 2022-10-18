// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'models/hotel.dart';

Future<HotelUuid> infoHotel(String assetsPath) async {

  try {
    var response = await Dio().get(assetsPath);
    var data = response.data;
    return HotelUuid.fromJson(data);
  } on DioError catch (e) {
    return Future.error(e.response!.data['message']);
  }
}
