import 'dart:developer';
import 'package:e_commerce_app/core/enums/loading_status.dart';
import 'package:e_commerce_app/core/enums/service_path.dart';
import 'package:e_commerce_app/model/user/loginModel/login_model.dart';
import 'package:e_commerce_app/model/user/loginResponseModel/login_response_model.dart';
import 'package:e_commerce_app/product/constant/hive_constant.dart';
import 'package:e_commerce_app/service/networkService/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base/service/base_cache_service.dart';
import '../../../../model/user/userCacheModel/user_cache_model.dart';
import '../../../../product/statics/app_statics.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.cacheService}) : super(SignInState()) {
    Future.microtask(() async {
      await cacheService?.init();
    });
  }

  BaseCacheService<UserCacheModel>? cacheService;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> login() async {
    //Follow this link for username and password : https://dummyjson.com/docs/auth#auth-login
    if (formKey.currentState!.validate()) {
      try {
        emit(state.copyWith(loadingStatus: LoadingStatus.loading));
        LoginModel _loginModel = LoginModel(
            username: usernameController.text,
            password: passwordController.text);
        LoginResponseModel? response = await AuthService.instance
            .auth(objectModel: _loginModel, path: ServicePath.login);
        if (response != null) {
          UserCacheModel _userCacheModel =
              UserCacheModel(id: response.id, token: response.accessToken);
          cacheService?.putItem(HiveConstants.userInfoBoxName, _userCacheModel);
          AppStatics.updateUser(newUser: _userCacheModel);
          emit(state.copyWith(loadingStatus: LoadingStatus.success));
        } else {
          emit(state.copyWith(loadingStatus: LoadingStatus.failure));
        }
      } catch (error) {
        log("SignIn login Error: $error");
        emit(state.copyWith(loadingStatus: LoadingStatus.failure));
      }
    }
  }
}
