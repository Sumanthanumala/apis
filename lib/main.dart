import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapis/diopackage/diogetallproducts.dart';
import 'package:newapis/diopackage/diouploadprod.dart';
import 'package:newapis/home.dart';
import 'package:newapis/maps/googlemaps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  Diogetpage(),
    );
  }
}