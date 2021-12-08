



import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_demo/model/User.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future LoginUser(String loginkey, String password) async{
  String url = 'https://dev.ecom.advn.vn/api/16/v1/account/login';
  final response = await http.post(url,
    headers: {"Accept":"Application/json"},
    body: {'loginkey': loginkey,'password': password}

  );
  var convertedDatatojson = jsonDecode(response.body);

  return convertedDatatojson;
}
final User user = User();
Future update_avatar(String Authorization, String base64) async{

  // final user = await _getJsonFromSharedPreference();
  final User user = User();

  String url = 'https://dev.ecom.advn.vn/api/16/v1/account/update_avarta';
  final response = await http.post(url,
      headers: {'Authorization': Authorization},
      body: {"img": base64,
        "img_format": "png"}

  );
  var convertedDatatojson = jsonDecode(response.body);
  return convertedDatatojson;
}
Future update_user(String Authorization, String name, String phone, String address) async{


  // final User user = User();

  String url = 'https://dev.ecom.advn.vn/api/16/v1/account/update_user';
  final response = await http.post(url,
      headers: {'Authorization': Authorization},
      body: {"name": name,
        "phone": phone,
        "address": address,
      }

  );
  var convertedDatatojson = jsonDecode(response.body);
  return convertedDatatojson;
}

