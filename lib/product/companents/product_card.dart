import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_style.dart';
import '../../model/productModel/product_model.dart';
import 'custom_cached_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.product, required this.isVerticalItems});

  final ProductModel? product;
  final bool? isVerticalItems;

  @override
  Widget build(BuildContext context) {
    return isVerticalItems == true
        ? Container(
            width: context.width * 0.43,
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: context.border20Radius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(flex: 4),
                Text(
                  product?.title ?? "",
                  maxLines: 1,
                  style: AppTextStyle.blackRegular14,
                ),
                Text(
                  "USD ${product?.price}",
                  style: AppTextStyle.blackBold12,
                )
              ],
            ).pAll(context.heighVal),
          ).pOnly(right: context.heighVal)
        : Container(
            width: context.width * 0.9,
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: context.border20Radius),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product?.title ?? "",
                          maxLines: 3,
                          style: AppTextStyle.blackBold22,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Shop Now",
                            style: AppTextStyle.underwaterFernBold14,
                          ).pOnly(right: context.heighVal),
                          Assets.icons.icArrowRightSVG.toSvg,
                        ],
                      )
                    ],
                  ),
                ),
                _buildImage(flex: 3)
              ],
            ).pAll(context.heighVal),
          ).pOnly(right: context.heighVal);
  }

  Expanded _buildImage({required int flex}) {
    return Expanded(
      flex: flex,
      child: CustomCachedNetworkImage(
        imageUrl: product?.thumbnail ?? "",
      ),
    );
  }
}
