import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapis/detailscontroller.dart';

class ProductDetails extends StatelessWidget {

  final String id;

  ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Details')),
    );
  }
}