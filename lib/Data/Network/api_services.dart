import 'dart:convert';
import 'dart:io';

import 'package:weather_app/Data/app_exceptions.dart';

import 'base_api_services.dart';

import 'package:http/http.dart' as http;

class ApiServices implements BaseApiServices {
  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      default:
        throw FetchDataException(
            'Error while communication ${response.statusCode}');
    }
  }

  @override
  Future getApi(String url) async {
    dynamic jsonData;

    try {
      var response = await http.get(Uri.parse(url)).timeout(const Duration(
            seconds: 10,
          ));
      jsonData = jsonResponse(response);
    } on RequestTimeout {
      throw RequestTimeout('Request Timed out');
    } on SocketException {
      throw InternetException('No Internet');
    }

    return jsonData;
  }
}
