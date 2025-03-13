import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:flutter/material.dart';
import '../../core/assets/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.isBack,
    this.isVisibleLogo,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? isBack;
  final bool? isVisibleLogo;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: isVisibleLogo ?? false,
                  child: Assets.images.imHomeLogoPNG.toAssetImage
                      .pOnly(right: context.normalVal),
                ),
                Text(
                  title,
                  style: AppTextStyle.blackBold16,
                ),
              ],
            ),
            leading: isBack == true
                ? Assets.icons.icIosArrowLeftSVG.toSvg
                    .pAll(context.normalVal * 2)
                    .gestureDetector(onTap: () => context.router.back())
                : leading?.pAll(context.heighVal),
            actions: actions));
  }
}
