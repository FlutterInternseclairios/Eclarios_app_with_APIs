import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eclarios/network_api/baseapi.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic responcejson;
    try {
      final responce =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responcejson = returnResponce(responce);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeoutException('');
    }
    return responcejson;
  }

  dynamic returnResponce(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responcejson = jsonDecode(response.body.toString());
        return responcejson;
      case 400:
        dynamic responcejson = jsonDecode(response.body.toString());
        return responcejson;
      //throw InvalidUrl('');
      default:
        throw FetchDataException(
            ' Error Occured server side' + response.statusCode.toString());
    }
  }

  @override
  Future postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responcejson;
    try {
      final responce = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responcejson = returnResponce(responce);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeoutException('');
    }
    if (kDebugMode) {
      print(responcejson);
    }
    return responcejson;
  }
}
