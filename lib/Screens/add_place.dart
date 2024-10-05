import 'dart:io';

import 'package:favouriteplacesall/Widgets/imageInput.dart';
import 'package:favouriteplacesall/main.dart';
import 'package:favouriteplacesall/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    String title = '';
    File? selectedImage;

    void _addPlace() {
      final isValid = _formkey.currentState!.validate();
      if (!isValid || selectedImage == null) {
        return;
      }
      _formkey.currentState!.save();
      ref.read(placeProvider.notifier).addPlace(title, selectedImage!);
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: colorScheme.onSecondary,
      appBar: AppBar(
        title: const Text('Add new Place'),
        elevation: 10,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                onSaved: (newValue) {
                  title = newValue!;
                },
                validator: (title) {
                  if (title == null || title.isEmpty) {
                    return 'Enter a valid place name';
                  }
                  return null;
                },
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //image input
            ImageInput(
              onSelectImage: (image) {
                selectedImage = image;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: _addPlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
