import 'package:favouriteplacesall/models/places.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({
    super.key,
    //got error in initialization so not initializedbut can be initialized to provide predefined values
    required this.location,
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;
  @override
  State<Mapscreen> createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick Your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(onPressed: () {}, icon: Icon(Icons.save))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.lat, widget.location.lng),
          zoom: 16,
        ),
        markers: {
          Marker(
              markerId: MarkerId('M1'),
              position: LatLng(widget.location.lat, widget.location.lng)),
        },
      ),
    );
  }
}
