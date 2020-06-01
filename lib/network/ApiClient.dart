import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopmobilescanner/models/user.dart';

class ApiClient {
  static const baseUrl = 'https://www.mystreet.com';
  static const connectTimeout = 8000;
  static const receiveTimeout = 8000;
  static const sendTimeout = 8000;

  final Dio dio;

  ApiClient({@required this.dio}) : assert(dio != null);

  Future<User> login(String email, String password) async {
    final response = await dio.post('https://www.mystreet.com/login', data: {"email": email, "password": password});
    print(response);
    return (response.data);
  }


}