import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> fetchData(String url) async {
    try {
      Response response = await _dio.get(url);
      return response; // 데이터를 받아옴
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // 오류 처리
    }
  }
}
