import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapis/detailscontroller.dart';
import 'package:newapis/dioapis.dart';

class Productsdetailspage extends StatefulWidget {
  final int id;
  Productsdetailspage({super.key, required this.id});

  @override
  State<Productsdetailspage> createState() => _ProductsdetailspageState();
}

class _ProductsdetailspageState extends State<Productsdetailspage> {
   RxMap<dynamic, dynamic> pdetails = <dynamic, dynamic>{}.obs;
  @override
  void initState() {
    super.initState();
    details();
  }

  details() async {
    try {
      var response = await Dioapis()
          .dioget('https://dummyjson.com/products/${widget.id.toString()}');
      if (response.statusCode == 200) {
        setState(() {
          pdetails.value=response.data;
          print(pdetails);
        });        
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product details ${pdetails['title'] ?? ''}')),
      body:  Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pdetails['title'] ?? 'Loading .....'
              )]),
      ),
    );
  }
}