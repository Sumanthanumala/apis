import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapis/homecontroller.dart';
import 'package:newapis/productdetails.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  HomePagecontroller homePagecontroller =Get.put(HomePagecontroller());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Get All Products'),),
      body: Obx(() => ListView.builder(
        itemCount: homePagecontroller.myproducts.length,
        itemBuilder: (context, index) {
          List images=homePagecontroller.myproducts[index]["images"];
        return  InkWell(onTap: () {
          Get.to(ProductDetails(id: homePagecontroller.myproducts[index]["id"].toString()));
        },
          child: ListTile(
            title: Text(homePagecontroller.myproducts[index]["title"]),
            subtitle: Text(homePagecontroller.myproducts[index]["description"],
            overflow: TextOverflow.ellipsis),
            leading: SizedBox(width: 100.0,height: 100.0,
              child: Image.network(images[0])),
          ),
        );
      },),)
    );
  }
}