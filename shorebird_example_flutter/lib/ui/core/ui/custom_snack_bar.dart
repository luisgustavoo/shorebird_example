import 'package:flutter/material.dart';

enum CustomSnackBarType { error, success }

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required this.message,
    this.customSnackBarType = CustomSnackBarType.error,
    this.actionClick,
    super.key,
  }) : super(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          behavior: SnackBarBehavior.floating,
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: customSnackBarType == CustomSnackBarType.error
              ? Colors.red
              : Colors.green,
          action: SnackBarAction(
            label: 'Tentar novamente',
            onPressed: () {
              actionClick?.call();
            },
          ),
        );

  final String message;
  final VoidCallback? actionClick;
  final CustomSnackBarType customSnackBarType;
}
