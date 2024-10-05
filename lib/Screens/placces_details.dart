import 'package:favouriteplacesall/main.dart';
import 'package:favouriteplacesall/models/places.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final Places place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.onSecondary,
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
}
