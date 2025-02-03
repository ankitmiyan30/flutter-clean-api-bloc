import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:clean_demo/config/app_urls.dart';
import 'package:http/http.dart' as http;

class ApiRouter {
  var client = http.Client();

  Future<Map<String, String>> defaultHeader() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return headers;
  }

  Future<dynamic> getRequest(dynamic param, String endpoint) async {
    var header = await defaultHeader();
    try {
      var response = await client.get(
        Uri.parse('${AppUrls.baseUrl}$endpoint'),
        headers: header,
      );

      return processResponse(response);
    } on SocketException {
      log('No Internet');
    } on TimeoutException {
      log('Taking longer then expected');
    }
  }

  dynamic processResponse(http.Response response) {
    if (response.statusCode >= 199 && response.statusCode <= 299) {
      return utf8.decode(response.bodyBytes);
    }

    if (response.statusCode == 403) {
      return;
    }
    var error = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 400 &&
        error?['message'] == 'User Already Exists') {
      return;
    }

    return;
  }

  Future<dynamic> postRequest(Object param, String endpoint) async {
    var header = await defaultHeader();
    try {
      var response = await client.post(Uri.parse('${AppUrls.baseUrl}$endpoint'),
          headers: header, body: param);
      log('==> ${response.request} \n $param');
      log('==> ${response.request} \n ${response.body}');
      return processResponse(response);
    } on SocketException {
      log('No Internet');
    } on TimeoutException {
      log('Taking longer then expected');
    }
  }
}
