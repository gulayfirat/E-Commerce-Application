import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;

  final String hintText;
  final String? labelText;
  final String? prefixIcon;
  final String? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final String? errorText;
  final FocusNode? focusNode;
  void Function()? onTap;

  CustomTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.labelText,
      this.prefixIcon = "",
      this.suffixIcon = "",
      this.keyboardType,
      this.textInputAction,
      this.validator,
      this.onChanged,
      this.obscureText = false,
      this.errorText = "",
      this.focusNode,
      this.onTap});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        obscureText: widget.obscureText ?? false,
        controller: widget.controller,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        cursorHeight: context.heighVal,
        validator: widget.validator,
        onChanged: widget.onChanged,
        obscuringCharacter: '*',
        maxLines: 1,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: AppTextStyle.babyTalkGreyRegular14,
          hintText: widget.hintText,
          hintStyle: AppTextStyle.babyTalkGreyRegular14,
          errorText: widget.errorText,
          errorStyle: AppTextStyle.redHotRegular14,
          fillColor: AppColor.white,
          filled: true,
          contentPadding: context.heighPadding,
          prefixIcon: widget.prefixIcon!.isNotEmpty
              ? SvgPicture.asset(widget.prefixIcon!,
                      // ignore: deprecated_member_use
                      color: widget.errorText != ""
                          ? AppColor.redHot
                          : AppColor.babyTalkGrey)
                  .pAll(16)
              : null,
          suffixIcon: widget.suffixIcon!.isNotEmpty
              ? InkWell(
                  // onTap: widget.onTap,
                  child: SvgPicture.asset(widget.suffixIcon!,
                          // ignore: deprecated_member_use
                          color: widget.errorText != ""
                              ? AppColor.redHot
                              : AppColor.babyTalkGrey)
                      .pAll(16),
                )
              : null,
          focusedBorder: _buildBorder(color: AppColor.babyTalkGrey),
          disabledBorder: _buildBorder(color: AppColor.babyTalkGrey),
          enabledBorder: _buildBorder(color: AppColor.babyTalkGrey),
          errorBorder: _buildBorder(color: AppColor.babyTalkGrey),
          focusedErrorBorder: _buildBorder(color: AppColor.babyTalkGrey),
        ));
  }

  OutlineInputBorder _buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: context.border10Radius,
      borderSide: BorderSide(color: color),
    );
  }
}
