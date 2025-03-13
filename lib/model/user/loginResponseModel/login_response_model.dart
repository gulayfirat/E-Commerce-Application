import 'package:e_commerce_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends BaseModel {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? accessToken;
  final String? refreshToken;

  LoginResponseModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.accessToken,
    this.refreshToken,
  });

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  @override
  Map<String, dynamic>? toJson() => _$LoginResponseModelToJson(this);

  LoginResponseModel copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? accessToken,
    String? refreshToken,
  }) =>
      LoginResponseModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );
}
