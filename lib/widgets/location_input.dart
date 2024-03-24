import 'dart:convert';
import 'package:favorite_place_app/models/place.dart';
import 'package:favorite_place_app/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectedLocation});
  final void Function(PlaceLocation location) onSelectedLocation;
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;
  //Get the location image as map
  String get locationImage {
    if (_pickedLocation == null) {
      return '';
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag'; // its working
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
//here need time to fetch location, so use here spiner that means loading
    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    if (lat == null || lng == null) {
      return;
    }

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag'); //instructor's key, expired the key
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address =
        resData['results'][0]['formatted_address']; // according to json format
    setState(() {
      _pickedLocation =
          PlaceLocation(latitude: lat, longitude: lng, address: address);
      _isGettingLocation = false;
    });
    //put the value to the parameter function
    widget.onSelectedLocation(
        _pickedLocation!); // it will not be null, already checked

    //save current location lat lang human readable address
    _savePlace(lat,lng);
    //get the lat and lang to current location
    print("latitude: ${locationData.latitude}");
    print("longitude: ${locationData.longitude}");
  }

  // By click select on Map button (TextButton.icon) navigate to MapScreen() and  select location on map by user click a specific point and when pop then back with user selected point location lat,lng,
  void _selectOnMap() async {
    //received data from MapScreen() when pop
    final pickedLocation = await Navigator.of(context).push<LatLng>(
      //from map we will get the lat lng from map.dart
      MaterialPageRoute(
        builder: (ctx) =>
            const MapScreen(), // no need to provie information for PlaceLocation location and boolean isSelecting, because we are receiving data from MapScreen()
      ),
    );
    //when user don't pick location by click then nothing to do, just exit the method
    if (pickedLocation == null) {
      return;
    }
    //if user picked the location then get that locations human readable address by lat and lan, it override the current location lat lng when app is run get the current location
    _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  //save user selected place (lat lng) and parse human readable address, Future<void> or just void both are same for async, just understand this result will get in future
  Future<void> _savePlace(double latitude, double longitude) async {
    //copy from _getCurrentLocation(), get user picked lat lang and parse it for human readable address
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag'); //instructor's key,
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address =
        resData['results'][0]['formatted_address']; // according to json format
    setState(() {
      _pickedLocation = PlaceLocation(
          latitude: latitude, longitude: longitude, address: address);
      _isGettingLocation = false;
    });
    //put the value to the parameter function, this value will receive where called this LocationInput() widget
    widget.onSelectedLocation(
        _pickedLocation!); // it will not be null, already checked
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location chosen',
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    );
    //get the google map image
    if (_pickedLocation != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //current location fetch
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Get current location'),
            ),

            //select location on map
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
            ),
          ],
        )
      ],
    );
  }
}
