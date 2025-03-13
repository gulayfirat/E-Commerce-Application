// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartProductModel _$AddCartProductModelFromJson(Map<String, dynamic> json) =>
    AddCartProductModel(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddCartProductModelToJson(
        AddCartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
    };
