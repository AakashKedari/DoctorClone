import 'dart:async';
import 'dart:developer';
import 'package:doctor_clone/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  final Completer<GoogleMapController> _googlemapController = Completer();
  double? mainLatitude = 18.5538;
  double? mainLongitude = 73.9477;

  void getCurrentLocation() async {
    GeolocatorAndroid()
        .requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      log('Error Occurred during Permissoin');
    });

    Position position = await GeolocatorAndroid().getCurrentPosition();
    mainLongitude = position.longitude;
    mainLatitude = position.latitude;
    final GoogleMapController controller = await _googlemapController.future;

    setState(() {
      log("Locaton got");
      CameraPosition cameraPosition = CameraPosition(
          zoom: 14, target: LatLng(mainLatitude!, mainLongitude!));
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: appBarColor,
          ),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: GoogleMap(
                myLocationEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(mainLatitude!, mainLongitude!),
                  zoom: 14,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _googlemapController.complete(controller);
                },
              )),
          Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.8,
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search),
                      border: InputBorder.none,
                      hintText: 'Search'),
                ),
              )),
        ],
      ),
    );
  }
}
