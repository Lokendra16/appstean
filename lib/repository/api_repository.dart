import 'dart:convert';

import 'package:appstean_test/main.dart';
import 'package:appstean_test/module/home/model/user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRepository {


  Future<List<UserResponse>> getList() async {
    try {
      final response = await dio.get('/users');
      List<UserResponse> res = (response.data as List<dynamic>)
          .map((user) => UserResponse.fromJson(user))
          .toList();
      return res;
    } catch (e) {
      debugPrint('Error updating user: $e');
      return [];
    }
  }


}
