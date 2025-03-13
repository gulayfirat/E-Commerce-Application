import 'package:flutter/material.dart';

extension MaterialNavigationExtension on BuildContext {
  void navigateToPage(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void navigateToNamedRoute(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void navigateToReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void navigateToNamedReplacement(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigateToAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  void navigateToNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void navigateBack() {
    Navigator.of(this).pop();
  }

  void navigateBackWithResult<T extends Object?>(T? result) {
    Navigator.of(this).pop(result);
  }

  void navigateToRoot() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
  
}
