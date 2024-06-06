import 'package:eclarios/network_api/network_api.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> LoginApi(var data) async {
    dynamic responce = await _apiService.postApi(
        data, "https://myeclapi.000webhostapp.com/users/checkuser.php"
        //"http://10.0.2.2/add_product_api_practice/users/checkuser.php"
        );
    return responce;
  }
}
