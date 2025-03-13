import 'dart:developer';
import 'package:e_commerce_app/product/constant/hive_constant.dart';
import 'package:e_commerce_app/product/statics/app_statics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/auth/splash/viewModel/splash_state.dart';
import '../../../../core/base/service/base_cache_service.dart';
import '../../../../model/user/userCacheModel/user_cache_model.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.cacheService}) : super(SplashState()) {
    Future.microtask(() async {
      await cacheService?.init();
      await userCheckLogin();
    });
  }

  BaseCacheService<UserCacheModel>? cacheService;

  Future<void> userCheckLogin() async {
    try {
      UserCacheModel? _userCacheModel =
          await cacheService?.getItem(HiveConstants.userInfoBoxName);
      if (_userCacheModel?.id != null) {
        AppStatics.updateUser(newUser: _userCacheModel);
        emit(state.copyWith(userCacheModel: _userCacheModel, isLogin: true));
      } else {
        emit(state.copyWith(isLogin: false));
      }
    } catch (error) {
      log("Splash userCheckLogin Error: $error ");
      emit(state.copyWith(isLogin: false));
    }
    log(state.isLogin.toString());
  }
}
