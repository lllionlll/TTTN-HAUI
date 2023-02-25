import 'package:flutter/material.dart';

Future<void> navigate(BuildContext context, Widget widget, {boo}) async {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
      )
  );
}

Future<void> navigateNotPop(BuildContext context, Widget widget, {boo}) async {
  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      )
  );
}