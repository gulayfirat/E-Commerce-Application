import 'package:e_commerce_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel {
  final String? email;
  final String? username;
  final String? password;

  RegisterModel({
    this.email,
    this.username,
    this.password,
  });

  @override
  BaseModel fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  RegisterModel copyWith({
    String? email,
    String? username,
    String? password,
  }) =>
      RegisterModel(
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
      );
}
