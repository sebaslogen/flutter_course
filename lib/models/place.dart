import 'dart:io';

import 'package:flutter/foundation.dart';

class Place {
  Place(
      {@required this.id,
      @required this.title,
      @required this.location,
      @required this.image});

  final String id;
  final String title;
  final PlaceLocation location;
  final File image;
}

class PlaceLocation {
  const PlaceLocation(
      {@required this.latitude, @required this.longitude, this.address});

  final double latitude;
  final double longitude;
  final String address;
}
