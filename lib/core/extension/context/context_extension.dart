import 'package:flutter/material.dart';

extension PaddingExtension on BuildContext {
  double get kZero => 0.0;

  EdgeInsets get zeroPadding => EdgeInsets.zero;
  EdgeInsets get normalPadding => EdgeInsets.all(normalVal);
  EdgeInsets get heighPadding => EdgeInsets.all(heighVal);
  double get normalVal => 8.0;
  double get heighVal => 14.0;
  double get pageHorizontal => 16.0;
  EdgeInsets topPadding(BuildContext context) =>
      EdgeInsets.only(top: context.height * 0.02);
  EdgeInsets bottomBarBottomPadding(BuildContext context) =>
      EdgeInsets.only(bottom: context.height * 0.16);
  EdgeInsets bottomPadding(BuildContext context) =>
      EdgeInsets.only(bottom: context.height * 0.03);
  EdgeInsets dynamicAllPadding(double value) => EdgeInsets.all(value);
  EdgeInsets dynamicSymmetricPadding(double? horizontal, double? vertical) =>
      EdgeInsets.symmetric(
          horizontal: horizontal ?? 0.0, vertical: vertical ?? kZero);
  EdgeInsets dynamicOnlyPadding(
          {double? top, double? bottom, double? right, double? left}) =>
      EdgeInsets.only(
          bottom: bottom ?? kZero,
          top: top ?? kZero,
          left: left ?? kZero,
          right: right ?? kZero);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get border4Radius => BorderRadius.circular(4.0);
  BorderRadius get border8Radius => BorderRadius.circular(8.0);
  BorderRadius get border10Radius => BorderRadius.circular(10.0);
  BorderRadius get border12Radius => BorderRadius.circular(12.0);

  BorderRadius get border20Radius => BorderRadius.circular(20.0);
  BorderRadius get border25Radius => BorderRadius.circular(25.0);
  BorderRadius get border30Radius => BorderRadius.circular(30.0);
  BorderRadius get border35Radius => BorderRadius.circular(35.0);
  //Vertical Top
  BorderRadius get borderVerticalTop10Radius =>
      const BorderRadius.vertical(top: Radius.circular(10.0));
  BorderRadius get borderVerticalTop12Radius =>
      const BorderRadius.vertical(top: Radius.circular(12.0));
  BorderRadius get borderVerticalTop15Radius =>
      const BorderRadius.vertical(top: Radius.circular(15.0));
  BorderRadius get borderVerticalTop28Radius =>
      const BorderRadius.vertical(top: Radius.circular(28.0));
  //Vertical Bottom
  BorderRadius get borderVerticalBottom10Radius =>
      const BorderRadius.vertical(bottom: Radius.circular(10.0));
  BorderRadius get borderVerticalBottom12Radius =>
      const BorderRadius.vertical(bottom: Radius.circular(12.0));
  BorderRadius get borderVerticalBottom15Radius =>
      const BorderRadius.vertical(bottom: Radius.circular(15.0));
  BorderRadius get borderVerticalBottom28Radius =>
      const BorderRadius.vertical(bottom: Radius.circular(28.0));
}

extension MediaQuerySizeExtension on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
  double get colorPaletteHeight => mediaQuery.height * 0.045;
  double get height => mediaQuery.height;
  double get width => mediaQuery.width;
  double get searchTextHeight => height * 0.05;
  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 300);
  Duration get mediumDuration => const Duration(seconds: 1);
  Duration get normalDuration => const Duration(seconds: 2);
  Duration get heighDuration => const Duration(seconds: 3);
}
