import 'package:http/http.dart' as http;
import 'dart:convert';

Future LoginUser(String loginkey, String password) async{
  String url = 'https://dev.ecom.advn.vn/api/16/v1/account/login';
  final response = await http.post(url,
    headers: {"Accept":"Application/json"},
    body: {'loginkey': loginkey,'password': password}

  );
  var convertedDatatojson = jsonDecode(response.body);
  return convertedDatatojson;
}