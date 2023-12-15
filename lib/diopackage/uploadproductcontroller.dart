import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newapis/apis.dart';
import 'package:newapis/dioapis.dart';

class UploadproductController extends GetxController {
  var namecontroller = TextEditingController();
  var pricecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();

  Apiservices apiservices = Get.put(Apiservices());

  httppostproductdetails() async {
    try {
      final body = {
        'title': namecontroller.text,
        'price': pricecontroller.text,
        'description': descriptioncontroller.text
      };
      final header = {'Content-Type': 'application/json'};
      http.Response response = await apiservices.postcalling(
          url: 'https://dummyjson.com/products/add',
          body: jsonEncode(body),
          headers: header);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final details = jsonDecode(response.body);
        print(details);
      } else {
        print('something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  dioprocuctdetailspost() async {
    try {
      final header = {'Content-Type': 'application/json'};
      final data = {
        'title': namecontroller.text,
        'price': pricecontroller.text,
        'description': descriptioncontroller.text
      };
      final response = await Dioapis().diopost(
          url: 'https://dummyjson.com/products/add',
          headers: header,
          data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
      } else {
        print('something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  httpputrequest() async {
    try {
      final presponse =
          await Dioapis().dioget('https://dummyjson.com/products/1');

      if (presponse.statusCode == 200 || presponse.statusCode == 201) {
        print(presponse.data);
      }

      final header = {'Content-Type': 'application/json'};
      final body = {
        'title': namecontroller.text,
        'price': pricecontroller.text,
        'description': descriptioncontroller.text
      };

      http.Response response = await apiservices.putcalling(
          url: 'https://dummyjson.com/products/1',
          body: jsonEncode(body),
          header: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  dioputrequest() async {
    try {
      final presponse =
          await Dioapis().dioget('https://dummyjson.com/products/1');

      if (presponse.statusCode == 200 || presponse.statusCode == 201) {
        print(presponse.data);
      }
      final data = {
        'title': namecontroller.text,
        'price': pricecontroller.text,
        'description': descriptioncontroller.text
      };
      final header = {'Content-Type': 'application/json'};
      final response = await Dioapis().dioput(
          url: 'https://dummyjson.com/products/1', data: data, header: header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  httpdeleterequest() async {
    try {
      http.Response response = await apiservices.deletecalling(
        url: 'https://dummyjson.com/products/1',
        header: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  diodeleterequest() async {
    try{
          final response = await Dioapis().diodelete(
      url: 'https://dummyjson.com/products/1',
      header: {'Content-Type': 'application/json'},
    );

    if(response.statusCode==200 || response.statusCode==201){
      print(response.data);
    }
    }catch(e){
      print(e.toString());
    }
  }

  
}