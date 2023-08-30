import 'package:dio/dio.dart';
import 'package:project/shared/components/constants.dart';

class DioHelper {
  static late final Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> get({required url, query}) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
