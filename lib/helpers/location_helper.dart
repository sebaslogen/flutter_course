import 'dart:convert';

import 'package:http/http.dart' as http;

class LocationHelper {
  static String generateLocationPreviewImage(
      {String apiKey, double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap &markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$apiKey';
  }

  static Future<String> getPlaceAddress(
      {String apiKey, double latitude, double longitude}) async {
    String responseBody;
    try {
      final response = await http.get(
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey');
      responseBody = response.body;
      return json.decode(responseBody)['results'][0]['formatted_address'];
    } catch (error) {
      if (responseBody != null) {
        throw Exception('Error parsing expected fields in $responseBody');
      }
      rethrow;
    }
  }
}
