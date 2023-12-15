import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class Apiservices extends GetxService {
//get api

  Future<http.Response> getcalling(String endpoint) async {
    http.Response response = await http.get(Uri.parse(endpoint));
    return response;
  }

  Future<http.Response> postcalling(
      {required String url,
      required var body,
      required Map<String, String>? headers}) async {
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    return response;
  }

  Future<http.Response> putcalling(
      {required String url,
      required var body,
      required Map<String, String>? header}) async {
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: header);
    return response;
  }

  // Future<http.Response> patchcalling({required String endpoint}) async {
  //   http.Response response = await http.patch(Uri.parse(endpoint));
  //   return response;
  // }

  Future<http.Response> deletecalling(
      {required String url, required var header}) async {
    http.Response response = await http.delete(Uri.parse(url), headers: header);
    return response;
  }

}