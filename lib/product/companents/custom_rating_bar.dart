import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar(
      {super.key, required this.rating, required this.itemCount});

  final double? rating;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating ?? 0.0,
      minRating: 0.0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 20,
      itemCount: itemCount,
      itemBuilder: (context, _) => Icon(
        applyTextScaling: false,
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
