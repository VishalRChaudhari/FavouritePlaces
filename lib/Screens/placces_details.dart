import 'package:favouriteplacesall/main.dart';
import 'package:favouriteplacesall/models/places.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final Places place;
  String get locationImage {
    final lat = place.location.lat;
    final lng = place.location.lng;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$lng&key=AIzaSyBc4KqWTigM0tyNQGmZehOx_MbA5NhYzKo';
  }

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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(locationImage),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  alignment: Alignment.center,
                  child: Text(
                    place.location.address,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
