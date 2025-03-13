import 'package:e_commerce_app/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';

extension StringExtension on String {
  bool get isEmail => contains("@") && contains(".");
  bool get isNotShort => length >= 4;
  String get locale => this.tr();
}

extension SvgExtension on String {
  Widget get toSvg => SvgPicture.asset(this);
  Widget toColorSvg({Color? color}) => SvgPicture.asset(this, color: color);
}

extension ImagesExtension on String {
  Widget get toAssetImage => Image.asset(this, fit: BoxFit.fill);
  AssetImage get toImageProvider => AssetImage(this);
  NetworkImage get toNetworkImageProvider => NetworkImage(this);
  Widget get toNetworkImage => Image.network(this, fit: BoxFit.fill);
}

extension LottieExtension on String {
  Widget toLottie({double? height, double? width}) =>
      Lottie.asset(this, height: height, width: width);
}

extension EmptyValidateExtension on String? {
  String? get emptyValidate =>
      this!.isEmpty ? LocaleKeys.SameKeyword_emptyText.locale : null;
}

extension EmailValidateExtension on String {
  bool get emailValidate => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}

extension DateTimeExtensions on DateTime {
  String toFormattedString({bool? isHour = true}) {
    return isHour == true
        ? "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')} ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}"
        : "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
  }
}

extension DateFormatExtension on String {
  DateTime get toDate => DateTime.parse(this);
}
