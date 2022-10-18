// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) => HotelPreview(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
    );

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

HotelUuid _$HotelUuidFromJson(Map<String, dynamic> json) => HotelUuid(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      address: HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      services: HotelAddressServises.fromJson(
          json['services'] as Map<String, dynamic>),
      photos: json['photos'] as List<dynamic>,
    );

Map<String, dynamic> _$HotelUuidToJson(HotelUuid instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) => HotelAddress(
      country: json['country'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      zip_code: json['zip_code'] as int,
      coords:
          HotelAddressCoords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zip_code,
      'coords': instance.coords,
    };

HotelAddressCoords _$HotelAddressCoordsFromJson(Map<String, dynamic> json) =>
    HotelAddressCoords(
      lat: (json['lat'] as num).toDouble(),
      lan: (json['lan'] as num).toDouble(),
    );

Map<String, dynamic> _$HotelAddressCoordsToJson(HotelAddressCoords instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

HotelAddressServises _$HotelAddressServisesFromJson(
        Map<String, dynamic> json) =>
    HotelAddressServises(
      free: json['free'] as List<dynamic>,
      paid: json['paid'] as List<dynamic>,
    );

Map<String, dynamic> _$HotelAddressServisesToJson(
        HotelAddressServises instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
