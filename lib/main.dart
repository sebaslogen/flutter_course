import 'package:flutter/material.dart';
import 'package:flutter_course/providers/great_places.dart';
import 'package:flutter_course/screens/add_place.dart';
import 'package:flutter_course/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

import 'widgets/ApisProviderWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ApisProviderWidget(
      child: ChangeNotifierProvider.value(
        value: GreatPlaces(),
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.indigo, accentColor: Colors.amber),
          home: PlacesListScreen(),
          routes: {AddPlaceScreen.routeName: (ctx) => AddPlaceScreen()},
        ),
      ),
    );
  }
}
