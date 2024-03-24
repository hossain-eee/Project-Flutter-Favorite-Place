import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
 const PlaceLocation(
      {required this.latitude, required this.longitude, required this.address});
  final double latitude;
  final double longitude;
  final String address;
}

class Place {
  //random id generate
  Place({
    required this.title,
    required this.image,
    required this.location,
    String? id,
     // in constructor take nullable String id, but its not member id which declared in class, instead it take value when constructor receive value (class object) and put that value in list initializer where we already define class member id (:id=)
  }) : id =id?? uuid.v4();
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
