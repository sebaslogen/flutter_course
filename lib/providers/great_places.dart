import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_course/helpers/db_helper.dart';
import 'package:flutter_course/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final place = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null);
    _items.add(place);
    notifyListeners();
    DBHelper.insert(
        'places',
        {'id': place.id, 'title': place.title, 'image': place.image.path})
  }
}
