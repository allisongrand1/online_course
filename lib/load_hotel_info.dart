import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:dio/dio.dart';

import 'models/hotel.dart';

 Future<String> infoHotel(String assetsPath) async{
  List<HotelUuid> _hotelUuid = [];
  String errorMessage = '';

    try {
      var _response = await Dio()
          .get(assetsPath);
     var _data = _response.data;
      print(_data);
        _hotelUuid =
          _data.map<HotelUuid>((hotel) => HotelUuid.fromJson(hotel)).toList();  
      return _hotelUuid.toString();
    } on DioError catch (e) {
      
        return Future.error (e.response!.data['message']);
        
     
    }
}