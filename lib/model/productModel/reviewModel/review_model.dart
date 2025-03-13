import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class Review extends BaseModel {
  final double? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });
  @override
  Review fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ReviewToJson(this);
  Review copyWith({
    double? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) =>
      Review(
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
        date: date ?? this.date,
        reviewerName: reviewerName ?? this.reviewerName,
        reviewerEmail: reviewerEmail ?? this.reviewerEmail,
      );
}
