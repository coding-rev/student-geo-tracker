import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  
  const MapScreen({ 
    Key? key, 
    required this.long,
    required this.lat
    }) : super(key: key);

    final double long;
    final double lat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:Text("$long", style: TextStyle(color:Colors.black,fontSize:20),))
      
    );
  }
}