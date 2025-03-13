import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_style.dart';
import '../../model/cartModel/cartProductModel/cart_product_model.dart';
import 'custom_cached_network_image.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart(
      {Key? key,
      required this.product,
      required this.removeProduct,
      required this.decreaseQuantity,
      required this.increaseQuantity,
      required this.index})
      : super(key: key);
  final CartProductModel? product;
  final Function(int index)? removeProduct;
  final Function(int index)? decreaseQuantity;
  final Function(int index)? increaseQuantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.width * 0.22,
          width: context.width * 0.22,
          decoration: BoxDecoration(
              borderRadius: context.border10Radius,
              color: AppColor.cascadingWhite),
          child: CustomCachedNetworkImage(imageUrl: product?.thumbnail ?? "")
              .pAll(context.normalVal),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product?.title ?? "",
                style: AppTextStyle.blackRegular16,
              ),
              Text(
                "USD ${product?.price ?? ""}",
                style: AppTextStyle.blackBold14,
              ).pOnly(bottom: context.normalVal),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.babyTalkGrey),
                                  borderRadius: context.border8Radius,
                                ),
                                child: Assets.icons.icMinusSVG.toSvg
                                    .pAll(context.normalVal / 3))
                            .gestureDetector(onTap: () {
                          if (decreaseQuantity != null) {
                            decreaseQuantity!(index);
                          }
                        }),
                        Text(("${product?.quantity ?? 0}"))
                            .pSymetric(horizontal: context.heighVal),
                        Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.babyTalkGrey),
                                  borderRadius: context.border8Radius,
                                ),
                                child: Assets.icons.icPlusSVG.toSvg
                                    .pAll(context.normalVal / 2))
                            .gestureDetector(onTap: () {
                          if (increaseQuantity != null) {
                            increaseQuantity!(index);
                          }
                        }),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Assets.icons.icTrashSVG.toSvg.gestureDetector(
                          onTap: () {
                        if (removeProduct != null) {
                          removeProduct!(index);
                        }
                      })),
                ],
              )
            ],
          ).pOnly(left: context.heighVal),
        )
      ],
    ).sized(width: context.width).pConstBottom(context);
  }
}
