import 'package:get/get.dart';
import 'api_service.dart';

class DataController extends GetxController {
  var isLoading = true.obs; // 로딩 상태 관리
  var dataList = [].obs; // 데이터 리스트 관리
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchData(); // 초기화 시 데이터 불러오기
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var response = await apiService.fetchData('http://10.0.2.2:8000/api/koreaib/news/');
      if (response.statusCode == 200) {
        dataList.assignAll(response.data);
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false); // 로딩 완료
    }
  }
}
