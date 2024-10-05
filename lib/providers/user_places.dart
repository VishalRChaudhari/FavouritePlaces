import 'dart:io';

import 'package:favouriteplacesall/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Places>> {
  UserPlaceNotifier() : super(const []);

  void addPlace(String title, File image) {
    final newPlace = Places(title: title, image: image);
    state = [newPlace, ...state];
  }
}

final placeProvider = StateNotifierProvider<UserPlaceNotifier, List<Places>>(
  (ref) => UserPlaceNotifier(),
);
