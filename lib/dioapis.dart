import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class Dioapis {
  final dio = Dio();
  Future<Response> dioget(String url) async {
    final response = await dio.get(url, queryParameters: {'limit': 100});
    return response;
  }

  Future<Response> diopost({
    required String url,
    required var headers,
    required var data,
  }) async {
    Response response =
        await dio.post(url, data: data, options: Options(headers: headers));
    return response;
  }

  Future<Response> dioput(
      {required String url, required var data, var header}) async {
    Response response =
        await dio.put(url, data: data, options: Options(headers: header));
    return response;
  }

  Future<Response> diodelete({required String url, required var header}) async {
    Response response =
        await dio.delete(url, options: Options(headers: header));
    return response;
  }

  Future<Future<Response>> diouplaodimage(File file) async {
    final filename= file.path.split('/').last;
    FormData  data =  FormData.fromMap({
      'image' : await MultipartFile.fromFile(file.path,filename: filename,)
    });
    final response= dio.post('',data: data);
    return response;
  }
  
}