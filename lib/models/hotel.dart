import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({required this.uuid, required this.name, required this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable()
class HotelUuid {
  final String uuid;
  final String name;
  final String poster;
  final HotelAddress address;
  final double price;
  final double rating;
  final HotelAddressServises services;
  final List photos;

  HotelUuid({
    required this.uuid,
    required this.name,
    required this.poster,
    required this.address,
    required this.price,
    required this.rating,
    required this.services,
    required this.photos,
  });

  factory HotelUuid.fromJson(Map<String, dynamic> json) =>
      _$HotelUuidFromJson(json);
  Map<String, dynamic> toJson() => _$HotelUuidToJson(this);
}

@JsonSerializable()
class HotelAddress {
  final String country;
  final String street;
  final String city;
  final String zip_code;
  final HotelAddressCoords coords;

  HotelAddress({
    required this.country,
    required this.street,
    required this.city,
    required this.zip_code,
    required this.coords,
  });

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable()
class HotelAddressCoords {
  final double lat;
  final double lan;

  HotelAddressCoords({
    required this.lat,
    required this.lan,
  });

  factory HotelAddressCoords.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressCoordsToJson(this);
}

@JsonSerializable()
class HotelAddressServises {
  final List free;
  final List paid;

  HotelAddressServises({
    required this.free,
    required this.paid,
  });

  factory HotelAddressServises.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressServisesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressServisesToJson(this);
}