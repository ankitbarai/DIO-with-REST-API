import 'package:dio/dio.dart';
class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(BaseOptions(
    baseUrl: "https://api.escuelajs.co/api/v1",
  )
  );
}
