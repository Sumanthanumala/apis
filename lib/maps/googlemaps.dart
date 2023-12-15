import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Mapspage extends StatefulWidget {
  const Mapspage({super.key});

  @override
  State<Mapspage> createState() => _MapspageState();
}

class _MapspageState extends State<Mapspage> {
  final Completer<GoogleMapController> mapcontroller =
      Completer<GoogleMapController>();
  final Cameraposition = CameraPosition(target: LatLng(0, 0), zoom: 14);
  Location location = new Location();
  LatLng? currentP = null;
  var controller = TextEditingController();
  List<LatLng> points = [
    LatLng(17.4124, 78.4843),
    LatLng(17.4124, 78.5045),
    LatLng(17.4345, 78.5045),
    LatLng(17.4345, 78.4843),
  ];
  Set<Polygon> polygon = {};
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    getlocation();
    for (int i = 0; i < points.length; i++) {
      markers.add(Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: points[i]));
    }
    polygon.add(Polygon(
        polygonId: PolygonId('1'),
        fillColor: Colors.blue,
        strokeColor: Colors.blue.withOpacity(0.5),
        points: points,
        strokeWidth: 1));

    if (currentP != null) {
      checkLocation(currentP!, points);
    }
  }

  bool isLocationInsidePolygon(LatLng location, List<LatLng> polygonPoints) {
    double x = location.latitude;
    double y = location.longitude;
    int intersectCount = 0;

    for (int i = 0; i < polygonPoints.length - 1; i++) {
      double x1 = polygonPoints[i].latitude;
      double y1 = polygonPoints[i].longitude;
      double x2 = polygonPoints[i + 1].latitude;
      double y2 = polygonPoints[i + 1].longitude;

      if ((y1 <= y && y < y2) || (y2 <= y && y < y1)) {
        double intersection = (y - y1) / (y2 - y1) * (x2 - x1) + x1;

        if (x <= intersection) {
          intersectCount++;
        }
      }
    }

    return (intersectCount % 2) == 1; // Inside if odd number of intersections
  }

  void checkLocation(LatLng position, List<LatLng> points) {
    if (isLocationInsidePolygon(position, points)) { 
        showDialog(context: context, builder: (context) {
          return Text('data');
        },);
       } else {
      print('Point is outside the polygon.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Maps')),
      body: Stack(
        children: [
          currentP == null
              ? Center(
                  child: Text('Loading...'),
                )
              : GoogleMap(
                  initialCameraPosition: Cameraposition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) {
                    mapcontroller.complete(controller);
                  },
                  polygons: polygon,
                  markers: markers,
                ),
        ],
      ),
    );
  }

  camposition(LatLng pos) async {
    GoogleMapController controller = await mapcontroller.future;
    CameraPosition newpos = CameraPosition(target: pos, zoom: 14);

    await controller.animateCamera(CameraUpdate.newCameraPosition(newpos));
  }

  getlocation() async {
    try{
      bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentlocation) {
      if (currentlocation.latitude != null &&
          currentlocation.longitude != null) {
        setState(() {
          currentP =
              LatLng(currentlocation.latitude!, currentlocation.longitude!);
          print(currentP!.latitude);
          print(currentP!.longitude);
          camposition(currentP!);
        });
      }
    });
    
    }catch(e){
      print(e.toString());
    }
  }
}
