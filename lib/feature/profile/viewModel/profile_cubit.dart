import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/profile/viewModel/profile_state.dart';

import '../../../core/base/service/base_cache_service.dart';
import '../../../core/enums/service_path.dart';
import '../../../model/user/userCacheModel/user_cache_model.dart';
import '../../../model/userModel/user_model.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../product/statics/app_statics.dart';
import '../../../service/networkService/app_service.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.cacheService}) : super(ProfileState()) {
    Future.microtask(() async {
      await cacheService?.init();
      await getUser();
    });
  }

  BaseCacheService<UserCacheModel>? cacheService;

  Future<void> getUser() async {
    final UserModel? _user = await AppService.instance
        .getObjectData(objectModel: UserModel(), path: ServicePath.user.subUrl);
    emit(state.copyWith(user: _user));
  }

  Future<void> logout() async {
    try {
      if (AppStatics.user?.id != null) {
        await cacheService?.removeItem(HiveConstants.userInfoBoxName);
        AppStatics.updateUser(newUser: null);
        if (AppStatics.user?.id == null) {
          emit(state.copyWith(isLogout: true));
        } else {
          emit(state.copyWith(isLogout: false));
        }
      }
    } catch (error) {
      log("Logout Error: $error ");
      emit(state.copyWith(isLogout: false));
    }
  }
}
