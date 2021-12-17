import 'package:dio/dio.dart';

class Parameters{
  static String baseUrl='http://api.kachichef.ir';
  static String apiVersion = 'api/v1';
  static String fullUrl = '$baseUrl/$apiVersion';
  static Map<String, dynamic>? header;
  static String? token;
  static Dio dio = Dio(BaseOptions(
    baseUrl: Parameters.fullUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
  ));
}