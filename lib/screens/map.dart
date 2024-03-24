import 'package:favorite_place_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      /*   latitude: 37.4219983,
      longitude: -122.084,
      address: '', */
      //lat lng of dhaka
      latitude: 23.8041,
      longitude: 90.4152,
      address: '',
    ),
    this.isSelecting = true,
  });
  final PlaceLocation location;
  final bool isSelecting;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  bool _isLoading = true; // Flag to track map loading state

  @override
  void initState() {
    super.initState();
    // Handle GoogleMap loading completion using a listener or callback
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
          const Duration(milliseconds: 2500)); // Optional delay
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(
                      _pickedLocation); // carry user picked lat lng when pop
                },
                icon: const Icon(Icons.save))
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onTap: !widget.isSelecting
                  ? null
                  : (position) {
                      setState(() {
                        _pickedLocation = position;
                      });
                    },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.location.latitude,
                  widget.location.longitude,
                ),
                zoom: 16,
              ),
              markers: (_pickedLocation == null && widget.isSelecting)
                  ? {}
                  : {
                      Marker(
                        markerId: const MarkerId('m1'),
                        //move marker according to user selected point
                        /*   position: _pickedLocation != null
                ? _pickedLocation!
                : LatLng(
                    widget.location.latitude,
                    widget.location.longitude,
                  ), */
                        //same logic instead of true flase, use i want use _pickedLocation but if its null then use LatLng()
                        position: _pickedLocation ??
                            LatLng(
                              widget.location.latitude,
                              widget.location.longitude,
                            ),
                      ),
                    },
            ),
    );
  }
}
