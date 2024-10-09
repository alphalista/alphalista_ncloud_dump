import 'package:get/get.dart';
import 'api_service.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  var market_bond_issue_info = [].obs;
  var market_bond_inquire_daily_price = [].obs;
  var news = [].obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading(true);
    try {
      final responses = await Future.wait([
        apiService.fetchData('http://10.0.2.2:8000/api/koreaib/market-bond-issue-info/market_bond_issue_info/?code=KR6150351E98'),
        apiService.fetchData('http://10.0.2.2:8000/api/koreaib/market-bond-inquire-daily-price/market_bond_issue_info/?code=KR6150351E98'),
        apiService.fetchData('http://10.0.2.2:8000/api/koreaib/news/data/?query=%EC%82%BC%EC%84%B1&sort=date')
      ]);

      final response1 = responses[0];
      final response2 = responses[1];
      final response3 = responses[2];

      if (response1.statusCode == 200 && response2.statusCode == 200 && response3.statusCode == 200) {
        market_bond_issue_info.clear();
        market_bond_inquire_daily_price.clear();
        news.clear();

        if (response1.data is Map) {
          market_bond_issue_info.add(response1.data);
        }
        if (response2.data is List) {
          market_bond_inquire_daily_price.assignAll(response2.data.map((item) => item['fields']).toList());
        }
        if (response3.data is Map) {
          news.assignAll(response3.data['items']);
        }
      } else {
        print('Failed to load data from one or more endpoints');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
