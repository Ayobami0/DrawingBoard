import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> showSnackBar(BuildContext context, String message,
    {Color? backgroundColor, IconData? icon}) async {
  await Flushbar(
    maxWidth: 300,
    icon: icon != null ? FaIcon(icon) : null,
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(milliseconds: 2000),
    margin: const EdgeInsets.all(10),
    borderRadius: BorderRadius.circular(8),
    backgroundColor: backgroundColor ?? const Color(0xFF303030),
    message: message,
    flushbarStyle: FlushbarStyle.FLOATING,
  ).show(context);
}
