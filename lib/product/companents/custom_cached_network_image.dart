import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/product/widgets/custom_circle_progress.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const CustomCachedNetworkImage(
      {super.key, required this.imageUrl, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        placeholder: (context, url) => CustomCircleProgress(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
