import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'info_api.dart';

class User {
  late Data? data;
  late bool success;


  User({required this.data, required this.success});

  User.fromJson(Map<String, dynamic> json) {
    data = json['info'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['info'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }

  @override
  String toString() {
    return '"user" : {${data.toString()}, "success": $success}';
  }
}