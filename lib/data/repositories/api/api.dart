import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  Dio _dio = Dio();
  Dio get dio => _dio;
  API() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
    _dio.interceptors.add(PrettyDioLogger(responseBody: false));
  }
}
