import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? const Text('No Location Chosen', textAlign: TextAlign.center)
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                label: const Text('Current Location'),
                textColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.location_on),
                onPressed: _getCurrentLocation),
            FlatButton.icon(
                label: const Text('Select on Map'),
                textColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.map),
                onPressed: () {})
          ],
        )
      ],
    );
  }
}
