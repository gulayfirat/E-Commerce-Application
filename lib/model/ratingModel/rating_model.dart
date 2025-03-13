import '../../core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class Rating extends BaseModel {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  @override
  BaseModel fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$RatingToJson(this);
  Rating copyWith({
    double? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );
}
