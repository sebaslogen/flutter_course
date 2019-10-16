import 'package:flutter/material.dart';
import 'package:flutter_course/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 52.35186, longitude: 4.88397),
      this.isSelecting = false});

  final PlaceLocation initialLocation;
  final bool isSelecting;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () => Navigator.of(context).pop(_pickedLocation),
            )
        ],
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.initialLocation.latitude,
                  widget.initialLocation.longitude),
              zoom: 16),
          onTap: widget.isSelecting ? _selectLocation : null,
          markers: (_pickedLocation == null && widget.isSelecting)
              ? null
              : {
                  Marker(
                      markerId: MarkerId('myId'),
                      position: _pickedLocation ??
                          LatLng(widget.initialLocation.latitude,
                              widget.initialLocation.longitude)),
                }),
    );
  }
}
