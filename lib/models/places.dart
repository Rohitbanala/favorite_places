import 'dart:io';

import 'package:uuid/uuid.dart';

final uuid = Uuid();
class Places {
  Places({
    required this.title,
    required this.img,
    required this.location,
    String? id,
  }): id = id ?? uuid.v4();
  final String title;
  final String id;
  final File img;
  final PlaceLocation location;
}

class PlaceLocation {
  const PlaceLocation({required this.lat, required this.lng, required this.address});
  final double lat;
  final double lng;
  final String address;
}