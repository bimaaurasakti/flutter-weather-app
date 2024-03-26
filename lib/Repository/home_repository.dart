import '../Data/Network/api_services.dart';
import '../Resources/AppUrl/app_url.dart';

class HomeRepository {
  static Future<dynamic> hitApi() async {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}
