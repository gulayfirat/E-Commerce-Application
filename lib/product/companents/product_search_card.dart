import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:e_commerce_app/product/companents/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_style.dart';
import '../../model/productModel/product_model.dart';
import 'custom_rating_bar.dart';

class ProductSearchCard extends StatelessWidget {
  const ProductSearchCard({super.key, required this.product});
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: context.width * 0.2,
            width: context.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: context.border10Radius,
              color: AppColor.cascadingWhite,
            ),
            child: CustomCachedNetworkImage(
              imageUrl: product?.thumbnail ?? "",
            ),
          ).pOnly(right: context.heighVal),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.title ?? "",
                  style: AppTextStyle.blackRegular16,
                  maxLines: 1,
                ),
                Text(
                  "USD ${product?.price}",
                  style: AppTextStyle.blackBold14,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomRatingBar(
                          rating: product?.rating,
                          itemCount: 1,
                        ),
                        Text(
                          "${product?.rating}",
                          style: AppTextStyle.blackRegular12,
                        ).pOnly(right: context.heighVal),
                        Text(
                          "${product?.reviews?.length}",
                          style: AppTextStyle.blackRegular12,
                        ).pOnly(right: context.normalVal * 0.5),
                        Text(
                          "Reviews",
                          style: AppTextStyle.blackRegular12,
                        ),
                      ],
                    ),
                    Assets.icons.icMoreVerticalSVG.toSvg
                  ],
                )
              ],
            ),
          )
        ],
      ).pSymetric(vertical: context.normalVal),
    );
  }
}
