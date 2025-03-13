import 'package:e_commerce_app/core/base/model/base_model.dart';
import 'package:e_commerce_app/model/productModel/metaModel/meta_model.dart';
import 'package:e_commerce_app/model/productModel/reviewModel/review_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dimensionsModel/dimensions_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  @override
  ProductModel fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ProductModelToJson(this);

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) =>
      ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        rating: rating ?? this.rating,
        stock: stock ?? this.stock,
        tags: tags ?? this.tags,
        brand: brand ?? this.brand,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        warrantyInformation: warrantyInformation ?? this.warrantyInformation,
        shippingInformation: shippingInformation ?? this.shippingInformation,
        availabilityStatus: availabilityStatus ?? this.availabilityStatus,
        reviews: reviews ?? this.reviews,
        returnPolicy: returnPolicy ?? this.returnPolicy,
        minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
        meta: meta ?? this.meta,
        images: images ?? this.images,
        thumbnail: thumbnail ?? this.thumbnail,
      );
}
