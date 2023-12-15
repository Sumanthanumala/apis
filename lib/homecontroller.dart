import 'dart:convert';

import 'package:get/get.dart';
import 'package:newapis/apis.dart';
import 'package:http/http.dart' as http;
import 'package:newapis/dioapis.dart';

class HomePagecontroller extends GetxController {
  Apiservices apiservices = Get.put(Apiservices());
  RxList<dynamic> myproducts = <dynamic>[].obs;
  @override
//get using dio get function
  Future<void> onInit() async {
    super.onInit();
    var response = await Dioapis().dioget('https://request.in/api/users');
    if(response.statusCode==200){
      print(response.data);
    }
  }
  //get using http package
  // Future<void> onInit() async {
  //   super.onInit();
  //   http.Response response =
  //       await apiservices.getcalling('https://dummyjson.com/products');
  //   if (response.statusCode == 200) {
  //     myproducts.value = jsonDecode(response.body)['products'];
  //   }
  // }
}