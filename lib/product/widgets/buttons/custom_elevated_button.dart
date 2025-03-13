// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';

class CustomnElevatedButton extends StatefulWidget {
  final void Function() onTap;
  final String text;
  final double? width;
  final double? height;
  final Widget? trailing;
  CustomnElevatedButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
      this.trailing})
      : super(key: key);

  @override
  State<CustomnElevatedButton> createState() => _CustomnElevatedButtonState();
}

class _CustomnElevatedButtonState extends State<CustomnElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? context.height * 0.065,
      width: widget.width ?? context.width,
      decoration: BoxDecoration(
          borderRadius: context.border12Radius, color: AppColor.underwaterFern),
      child: Row(
        mainAxisAlignment: widget.trailing != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: AppTextStyle.whiteBold16,
          ),
          widget.trailing ?? SizedBox.shrink(),
        ],
      ).pSymetric(horizontal: context.heighVal * 2),
    ).gestureDetector(onTap: widget.onTap);
  }
}
