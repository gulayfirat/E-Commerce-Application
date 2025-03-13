import 'package:e_commerce_app/core/assets/assets.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:flutter/material.dart';

class CustomServiceError extends StatelessWidget {
  const CustomServiceError({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.lotServiceError.toLottie().center();
  }
}
