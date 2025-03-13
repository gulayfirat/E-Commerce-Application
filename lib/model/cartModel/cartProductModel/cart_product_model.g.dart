// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'discountPercentage': instance.discountPercentage,
      'discountedTotal': instance.discountedTotal,
      'thumbnail': instance.thumbnail,
    };
