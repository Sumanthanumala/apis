import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapis/diopackage/uploadproductcontroller.dart';

class uploadproduct extends StatelessWidget {
  UploadproductController uploadController = Get.put(UploadproductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload a product')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
                controller: uploadController.namecontroller,
                decoration: InputDecoration(hintText: 'enter product name')),
            TextFormField(
                controller: uploadController.pricecontroller,
                decoration: InputDecoration(hintText: 'enter product price')),
            TextFormField(
                controller: uploadController.descriptioncontroller,
                decoration:
                    InputDecoration(hintText: 'enter product description')),
            ElevatedButton(onPressed: (){
              // uploadController.httppostproductdetails();
              // uploadController.dioprocuctdetailspost();
             // uploadController.httpputrequest();
            //  uploadController.dioputrequest();
           // uploadController.httpdeleterequest();
          //  uploadController.diodeleterequest();
            }, child: Text('Upload data'))
          ],
        ),
      ),
    );
  }
}