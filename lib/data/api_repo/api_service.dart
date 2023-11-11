import 'dart:convert';

import 'package:crypto_app/globals/globals.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> latestListingApi() async {
  try {
    Response response = await http.get(Uri.parse("$baseUrlV1$listing?limit=20"),
        headers: {"X-CMC_PRO_API_KEY": apiKey});

    if (response.statusCode == CODE_SUCCESS) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } else {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    }
  } catch (e) {
    print(e); 
  }
  return {};
}

Future<Map<String, dynamic>> infoMetadataApi(String id) async {
  try {
    Response response = await http.get(Uri.parse("$baseUrlV2$info?id=$id"),
        headers: {"X-CMC_PRO_API_KEY": apiKey});

    if (response.statusCode == CODE_SUCCESS) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } else {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    }
  } catch (e) {
    print(e);
  }
  return {};
}
