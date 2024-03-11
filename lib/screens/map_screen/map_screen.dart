import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double lat1=30.7124815;
  double long1=31.1069703;
  double lat2=33.7124815;
  double long2=35.1069703;
  List<Marker> markers=[
    // Marker(markerId: MarkerId("1"),
    // position: LatLng(25.692028,32.663452)
    // ),

  ];
GoogleMapController?gmc;
 _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('الرجاء تشغيل خدمة الموقع علي جهازك');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse) {
      double distanceInMeters = Geolocator.distanceBetween(lat1, long1,lat2, long2);
      print("======================");
      print(distanceInMeters/1000);
    }

  }
 CameraPosition cameraPosition = CameraPosition(
    target: LatLng(25.692028, 32.663452),
    zoom: 12,
  );
@override
  void initState() {
  _determinePosition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Container(
  child:Column(
    children: [
      Expanded(
        child: Stack(
          children: [
            GoogleMap(
              onTap: (LatLng latLng){
print("=====================");
print(latLng.latitude);
print(latLng.longitude);
print("=====================");
markers.add(Marker(markerId:MarkerId("1"),
position: LatLng(latLng.latitude,latLng.longitude)
));
setState(() {

});

              },
              markers: markers.toSet(),
              mapType: MapType.normal,
              initialCameraPosition: cameraPosition,
              onMapCreated: (mapcontroller) {
               gmc=mapcontroller;
              },
            ),
          ],
        
        ),
      ),
    ],
  ),


),
    );
  }
}
