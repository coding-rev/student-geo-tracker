import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:trackapp/constants.dart';

class MapScreen extends StatefulWidget {
  
  const MapScreen({ 
    Key? key, 
    required this.long,
    required this.lat,
    required this.studentName
    }) : super(key: key);

    final double long;
    final double lat;
    final String studentName;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  void setCustomMapPin() async {
      pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/marker.png');
   }
   @override
   void initState() {
      super.initState();
      setCustomMapPin();
   }
   

  @override
  Widget build(BuildContext context) {
    // Setting location on map and adding custom pin to location
    LatLng pinPosition = LatLng(widget.lat, widget.long);
   
    // these are the minimum required values to set 
    // the camera position 
    CameraPosition initialLocation = CameraPosition(
      zoom: 16,
      bearing: 30,
      target: pinPosition
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.studentName}", style: WhiteTexts.texth2),
        backgroundColor: Colors.red,
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        markers: _markers,
        initialCameraPosition: initialLocation,
        onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            setState(() {
              MarkerId markerId1 = MarkerId("1");
                        
              _markers.add(
                  Marker(
                    markerId: markerId1,
                    position: pinPosition,
                    icon: pinLocationIcon
                  )
              );
            });
       }),
    );

  }
}