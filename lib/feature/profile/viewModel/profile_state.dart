import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/enums/loading_status.dart';
import '../../../model/userModel/user_model.dart';

@immutable
class ProfileState extends Equatable {
  final LoadingStatus loadingStatus;

  final UserModel? user;
  final bool isLogout;
  const ProfileState(
      {this.loadingStatus = LoadingStatus.initial,
      this.user,
      this.isLogout = false});

  @override
  List<Object?> get props => [loadingStatus, user, isLogout];

  ProfileState copyWith(
      {LoadingStatus? loadingStatus, UserModel? user, bool? isLogout}) {
    return ProfileState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        user: user ?? this.user,
        isLogout: isLogout ?? this.isLogout);
  }
}
