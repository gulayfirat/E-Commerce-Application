import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

Future<dynamic> customShowDialog(
    {required BuildContext context, required Widget child}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          insetPadding: context.dynamicAllPadding(context.pageHorizontal),
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
              borderRadius: context.border12Radius), //this right here
          child: child);
    },
  );
}
