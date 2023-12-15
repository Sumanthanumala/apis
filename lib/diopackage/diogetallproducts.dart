import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapis/diopackage/productdetailspage.dart';
import 'package:newapis/homecontroller.dart';
import 'package:newapis/productdetails.dart';

class Diogetpage extends StatelessWidget {
   Diogetpage({super.key});

   HomePagecontroller homePagecontroller = Get.put(HomePagecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      // body: Obx(() => ListView.builder(
      //   itemCount: homePagecontroller.myproducts.length,
      //   itemBuilder: (context, index) {
      //     List images=homePagecontroller.myproducts[index]["images"];
      //   return  InkWell(onTap: () {
      //     Get.to(Productsdetailspage(id: homePagecontroller.myproducts[index]["id"]));
      //   },
      //     child: ListTile(
      //       title: Text(homePagecontroller.myproducts[index]["title"]),
      //       subtitle: Text(homePagecontroller.myproducts[index]["description"],
      //       overflow: TextOverflow.ellipsis),
      //       leading: SizedBox(width: 100.0,height: 100.0,
      //         child: Image.network(images[0])),
      //     ),
      //   );
      // },),)
    );
  }
}