import 'package:e_commerce_app/model/user/userCacheModel/user_cache_model.dart';

class AppStatics {
  static UserCacheModel? user;

  static void updateUser({UserCacheModel? newUser}) {
    user = newUser;
  }
}
