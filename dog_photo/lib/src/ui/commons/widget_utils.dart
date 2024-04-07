import 'package:flutter/material.dart';

class WidgetUtils {
  static void showDialogUtils(
    BuildContext context,
    Widget child,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }
}
