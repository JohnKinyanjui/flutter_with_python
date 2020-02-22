import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_py/models.py.dart';
String  url = "http://192.168.43.39:5000/store";


Future<List<Stores>> fetchStores(http.Client client) async {
  final response = await client.get(url);
  return compute(parseStores,response.body);
}
List<Stores> parseStores(String responsebody) {
  final parsed = json.decode(responsebody);
  return (parsed["stores"] as List)
      .map<Stores>((json) => new Stores.fromJson(json))
      .toList();
}

Future<Stores> createPost(String url, {Map body}) async{
  return http.post(url,body: body).then((http.Response response){
   return Stores.fromJson(json.decode(response.body));
  });
}