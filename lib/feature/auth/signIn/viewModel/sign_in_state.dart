import 'package:e_commerce_app/core/enums/loading_status.dart';
import 'package:e_commerce_app/model/user/loginModel/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class SignInState extends Equatable {
  final LoadingStatus loadingStatus;
  final LoginModel? loginModel;

  const SignInState(
      {this.loadingStatus = LoadingStatus.initial, this.loginModel});

  @override
  List<Object?> get props => [loadingStatus, loginModel];

  SignInState copyWith({LoadingStatus? loadingStatus, LoginModel? loginModel}) {
    return SignInState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        loginModel: loginModel ?? this.loginModel);
  }
}
