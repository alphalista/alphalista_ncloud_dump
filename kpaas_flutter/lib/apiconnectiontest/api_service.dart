import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  // GET 요청 예시
  Future<Response> fetchData(String url) async {
    try {
      Response response = await _dio.get(url);
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
