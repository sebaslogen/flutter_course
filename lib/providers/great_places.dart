import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_course/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    _items.add(Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null));
  }
}
