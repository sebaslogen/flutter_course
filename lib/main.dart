import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animated menu app',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange, accentColor: Colors.deepPurple),
        home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated menu'),
      ),
      backgroundColor: Colors.grey[700],
      body: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: PanFlareActor(
            width: 125.0,
            height: screenSize.height,
            filename: 'assets/slide-menu.flr',
            openAnimation: 'open',
            closeAnimation: 'close',
            direction: ActorAdvancingDirection.RightToLeft,
            threshold: 20.0,
            reverseOnRelease: true,
            completeOnThresholdReached: true,
            activeAreas: [
              RelativePanArea(
                area: const Rect.fromLTWH(0, 0.7, 1.0, 0.3),
//              debugArea: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
