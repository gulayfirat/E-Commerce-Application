import 'package:e_commerce_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseModel {
  final String? username;
  final String? password;

  LoginModel({
    this.username,
    this.password,
  });

  @override
  BaseModel fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  LoginModel copyWith({
    String? username,
    String? password,
  }) =>
      LoginModel(
        username: username ?? this.username,
        password: password ?? this.password,
      );
}
