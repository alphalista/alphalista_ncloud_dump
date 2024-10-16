import 'package:get/get.dart';
import 'api_service.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  var market_bond_issue_info = [].obs;
  var market_bond_inquire_daily_price = [].obs;
  var news = [].obs;
  var market_bond_code = [].obs;
  var market_bond_nextPage = ''.obs;
  var market_bond_prevPage = ''.obs;

  var otc_bond_code = [].obs;
  var otc_bond_nextPage = ''.obs;
  var otc_bond_prevPage = ''.obs;

  final ApiService apiService = ApiService();

  Future<List<dynamic>> fetchNewsData() async {
    isLoading(true);
    try {
      final response = await apiService.fetchData('http://10.0.2.2:8000/api/koreaib/news/data/?query=%EC%82%BC%EC%84%B1&sort=date');
      if (response.statusCode == 200 && response.data is Map) {
        news.clear();
        news.assignAll(response.data['items']);  // 뉴스 데이터 업데이트
        return news;  // 데이터를 반환합니다.
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

  // 장내채권 데이터를 가져오는 메서드
  Future<Map<String, dynamic>> fetchEtBondData(String url) async {
    isLoading(true);
    try {
      final response = await apiService.fetchData(url);
      if (response.statusCode == 200 && response.data is Map) {
        market_bond_code.assignAll(response.data['results']); // 채권 데이터 업데이트
        market_bond_nextPage.value = response.data['next'] ?? ''; // 다음 페이지 업데이트
        return response.data;  // 데이터를 반환
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

  // 장외채권 데이터를 가져오는 메서드 (장내채권과 동일한 방식)
  Future<Map<String, dynamic>> fetchOtcBondData(String url) async {
    isLoading(true);
    try {
      final response = await apiService.fetchData(url);
      if (response.statusCode == 200 && response.data is Map) {
        otc_bond_code.assignAll(response.data['results']); // 장외채권 데이터 업데이트
        otc_bond_nextPage.value = response.data['next'] ?? ''; // 다음 페이지 업데이트
        return response.data;  // 데이터를 반환
      } else {
        print('Failed to load OTC bond data');
        return {};
      }
    } catch (e) {
      print('Error fetching OTC bond data: $e');
      return {};
    } finally {
      isLoading(false);
    }
  }
}
