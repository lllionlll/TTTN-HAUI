import 'package:flutter/material.dart';

Future<void> navigate(BuildContext context, Widget widget) async {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
      )
  );
}