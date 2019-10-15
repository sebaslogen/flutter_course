import 'package:flutter/material.dart';
import 'package:flutter_course/providers/great_places.dart';
import 'package:provider/provider.dart';

import 'add_place.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              })
        ],
      ),
      body: FutureBuilder<void>(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                        child: Text('Got no places yet, start adding some!')),
                    builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                        ? ch
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(greatPlaces.items[i].image)),
                              title: Text(greatPlaces.items[i].title),
                              onTap: () {},
                            ),
                          ),
                  ),
      ),
    );
  }
}