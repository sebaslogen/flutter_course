import 'package:flutter/material.dart';
import 'package:flutter_course/helpers/location_helper.dart';
import 'package:flutter_course/models/secret.dart';
import 'package:flutter_course/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;

  LocationInput(this.onSelectPlace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  String _mapsApiKey;

  @override
  void initState() {
    super.initState();
    _mapsApiKey = Provider.of<Secret>(context, listen: false).apiKey;
  }

  void _showPreview(double latitude, double longitude) {
    final previewImageUrl = LocationHelper.generateLocationPreviewImage(
        apiKey: _mapsApiKey, latitude: latitude, longitude: longitude);
    setState(() {
      _previewImageUrl = previewImageUrl;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      final locationData = await Location().getLocation();
      _showPreview(locationData.latitude, locationData.longitude);
      widget.onSelectPlace(locationData.latitude, locationData.longitude);
    } catch (error) {
      return; // Handle when user does not grant the permission
    }
  }

  Future<void> _selectOnMap() async {
    final selectedLocation =
        await Navigator.of(context).push(MaterialPageRoute<LatLng>(
            fullscreenDialog: true,
            builder: (ctx) => const MapScreen(
                  isSelecting: true,
                )));
    if (selectedLocation == null) {
      return;
    }
    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
    widget.onSelectPlace(selectedLocation.latitude, selectedLocation.longitude);
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
                onPressed: _selectOnMap)
          ],
        )
      ],
    );
  }
}
