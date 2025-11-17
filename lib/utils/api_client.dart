// lib/utils/api_client.dart
import 'package:dio/dio.dart';
import '../core/app_config.dart';

class ApiClient {
  final AppConfig config;
  final Dio _dio;

  ApiClient(this.config) : _dio = Dio(BaseOptions(baseUrl: config.apiUrl));

  Future<Response> login(String email, String password) {
    return _dio.post('auth/login', data: {'email': email, 'password': password});
  }

  Future<Response> signup(String email, String password) {
    return _dio.post('auth/signup', data: {'email': email, 'password': password});
  }
}
