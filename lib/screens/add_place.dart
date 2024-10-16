import 'dart:io';

import 'package:favorite_places_app/models/places.dart';
import 'package:favorite_places_app/providers/user_places.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titlecontroller = TextEditingController();
  File? _selectImage;
  PlaceLocation? _selectedLocation;
  void _savePlace(){
    final enteredText = _titlecontroller.text;
    if(enteredText.isEmpty || enteredText.trim().isEmpty || _selectImage==null || _selectedLocation==null){
      return;
    }
    ref.read(UserPlacesProvider.notifier).addPlace(enteredText,_selectImage!,_selectedLocation!);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titlecontroller,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            ImageInput(onPickImage: (image){
              _selectImage = image;
            },),
            const SizedBox(
              height: 16,
            ),
            LocationInput(onSelectlocation: (value){
              _selectedLocation = value;
            },),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: _savePlace,
              label: const Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
