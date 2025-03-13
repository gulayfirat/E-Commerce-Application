import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/user/loginResponseModel/login_response_model.dart';

import '../../core/base/model/base_model.dart';
import '../../core/base/service/handle_service_error.dart';
import '../../core/enums/service_path.dart';
import '../../core/manager/network_manager.dart';

class AuthService {
  static AuthService? _instace;
  static AuthService get instance {
    if (_instace != null) return _instace!;
    _instace = AuthService();
    return _instace!;
  }

  Future<LoginResponseModel?> auth<T extends BaseModel>(
      {required T objectModel, required ServicePath path}) async {
    try {
      final response = await NetworkManager.instance.dio
          .post(path.subUrl, data: objectModel.toJson());
      LoginResponseModel responseModel =
          LoginResponseModel().fromJson(response.data);
      print("Auth Response->>> " + response.toString());
      return responseModel;
    } on DioException catch (e) {
      print('Error: $e');
      HandleServiceError().handleError(e);
      return null;
    }
  }
}
