import 'dart:convert';

import 'package:get/get.dart';
import 'api_service.dart';
import 'dummy_data.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  var market_bond_issue_info = [].obs;
  var market_bond_inquire_daily_price = [].obs;
  var news = [].obs;
  var market_bond_code = [].obs;
  var market_bond_nextPage = ''.obs;
  var market_bond_prevPage = ''.obs;

  var otc_bond_code = [].obs;

  final ApiService apiService = ApiService();

  Future<List<dynamic>> fetchNewsData() async {
    isLoading(true);
    try {
      final response = await apiService.fetchData(
          'http://localhost:8000/api/koreaib/news/data/?query=%EC%82%BC%EC%84%B1&sort=date');
      if (response.statusCode == 200 && response.data is Map) {
        news.clear();
        news.assignAll(response.data['items']); // 뉴스 데이터 업데이트
        return news; // 데이터를 반환합니다.
      } else {
        print('Failed to load news data');
        return [];
      }
    } catch (e) {
      print('Error fetching news: $e');
      return [];
    } finally {
      isLoading(false);
    }
  }

  Future<Map<String, dynamic>> fetchEtBondData(String url) async {
    isLoading(true);
    try {
      final response = await apiService.fetchData(url);
      if (response.statusCode == 200 && response.data is Map) {
        market_bond_code.assignAll(response.data['results']);
        market_bond_nextPage.value = response.data['next'] ?? '';
        return response.data;
      } else {
        print('Failed to load market bond data');
        return {};
      }
    } catch (e) {
      print('Error fetching market bond data: $e');
      return {};
    } finally {
      isLoading(false);
    }
  }

  Future<Map<String, dynamic>> fetchOtcBondData(String url) async {
    isLoading(true);
    try {
      final response = await apiService.fetchData(url);
      if (response.statusCode == 200 && response.data is Map) {
        market_bond_code.assignAll(response.data['results']);
        market_bond_nextPage.value = response.data['next'] ?? '';
        return response.data;
      } else {
        print('Failed to load market bond data');
        return {};
      }
    } catch (e) {
      print('Error fetching market bond data: $e');
      return {};
    } finally {
      isLoading(false);
    }
  }
}
