import 'package:favouriteplacesall/Screens/add_place.dart';
import 'package:favouriteplacesall/Widgets/places_list.dart';
import 'package:favouriteplacesall/main.dart';
import 'package:favouriteplacesall/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(placeProvider);
    return Scaffold(
      backgroundColor: colorScheme.onSecondary,
      appBar: AppBar(
        title: const Text(
          'Your Places',
        ),
        elevation: 10,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddPlace(),
                ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(
          places: userPlaces,
        ),
      ),
    );
  }
}
