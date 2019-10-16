import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_course/helpers/db_helper.dart';
import 'package:flutter_course/helpers/location_helper.dart';
import 'package:flutter_course/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(String mapsApiKey, String title, File image,
      PlaceLocation pickedLocation) async {
    final pickedLocationAddress = await LocationHelper.getPlaceAddress(
        apiKey: mapsApiKey,
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude);
    final place = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: PlaceLocation(
            latitude: pickedLocation.latitude,
            longitude: pickedLocation.longitude,
            address: pickedLocationAddress));
    _items.add(place);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
      'loc_lat': pickedLocation.latitude,
      'loc_long': pickedLocation.longitude,
      'address': pickedLocationAddress
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_long'],
              address: item['address'],
            )))
        .toList();
    notifyListeners();
  }
}
