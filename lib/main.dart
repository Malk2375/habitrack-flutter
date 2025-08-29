import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(HabiTrackApp());
}

class HabiTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabiTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
