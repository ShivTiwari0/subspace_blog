import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String Base_Url = 'https://intent-kit-16.hasura.app/api/';
const Map<String, dynamic> DEAFULT_HEADERS = {
  'x-hasura-admin-secret': '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6'
}; 
  
class Api {
  final Dio _dio = Dio();
  Api() {
    _dio.options.baseUrl = Base_Url;
    _dio.options.headers = DEAFULT_HEADERS;    
    _dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestBody: true,  
        requestHeader: true,
        responseHeader: true));
  }
  Dio get sendRequest => _dio;
}
 

class ApiResponse {
  dynamic data;
  String? message;
  
  ApiResponse({
    this.data,
    this.message,
  });
  
  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
      data: data["blogs"],
      message: response.statusMessage,
    );
  }
}
