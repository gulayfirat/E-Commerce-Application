// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartModel _$AddToCartModelFromJson(Map<String, dynamic> json) =>
    AddToCartModel(
      userId: (json['userId'] as num?)?.toInt(),
      products: (json['products'] as List<dynamic>?)
          ?.map(
              (e) => AddCartProductModel().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddToCartModelToJson(AddToCartModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'products': instance.products,
    };
