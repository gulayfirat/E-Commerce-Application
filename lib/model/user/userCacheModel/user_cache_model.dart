// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:e_commerce_app/core/base/model/base_model.dart';

import '../../../product/constant/hive_constant.dart';

part 'user_cache_model.g.dart';

@HiveType(typeId: HiveConstants.userInfoType)
@JsonSerializable()
class UserCacheModel extends BaseModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? token;
  UserCacheModel({
    this.id,
    this.token,
  });

  @override
  BaseModel fromJson(Map<String, dynamic> json) =>
      _$UserCacheModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserCacheModelToJson(this);
}
