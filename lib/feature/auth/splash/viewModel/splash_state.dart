// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../../model/user/userCacheModel/user_cache_model.dart';

@immutable
class SplashState extends Equatable {
  final UserCacheModel? userCacheModel;
  final bool isLogin;

  SplashState({this.userCacheModel = null, this.isLogin = false});

  @override
  List<Object?> get props => [userCacheModel, isLogin];

  SplashState copyWith({UserCacheModel? userCacheModel, bool? isLogin}) {
    return SplashState(
        userCacheModel: userCacheModel ?? this.userCacheModel,
        isLogin: isLogin ?? this.isLogin);
  }
}
