import 'package:flutter/material.dart';
import 'custom_toast.dart';

Future<void> showToast(String msg, BuildContext context) async {
  Toast.show(msg, context);
  await Future.delayed(
    Duration(
        seconds: 2
    ),
  );
  Toast.dismiss();
}