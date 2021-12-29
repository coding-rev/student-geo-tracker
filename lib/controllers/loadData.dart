import 'dart:convert';
import 'package:flutter/services.dart';

readData()async{
  final String response = await rootBundle.loadString('assets/dummy_data.json');
  var data = await json.decode(response);
  
  return data;  
}