import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class PlaceLocation {
  PlaceLocation({required this.address, required this.lat, required this.lng});

  final double lat;
  final double lng;
  String address;
}

class Places {
  Places({
    required this.title,
    required this.image,
    required this.location,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
