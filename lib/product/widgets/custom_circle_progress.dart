import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomCircleProgress extends StatelessWidget {
  final bool? isLoading;
  const CustomCircleProgress({super.key, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading ?? false,
      child: Center(
          child: CircularProgressIndicator(
              color: AppColor.underwaterFern, strokeWidth: 4.5)),
    );
  }
}
