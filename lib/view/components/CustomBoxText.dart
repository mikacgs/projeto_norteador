import 'package:flutter/material.dart';

class CustomBoxText extends SizedBox {
  static final ButtonStyle SUCCESS = ElevatedButton.styleFrom(
    // primary: Colors.green,
    // onPrimary: Colors.white,
    onSurface: Colors.grey,
    padding: const EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.5),
        side: BorderSide(color: Colors.red)
    ),
  );

  CustomBoxText({Widget child, Function onPressed, ButtonStyle style})
      : super(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      child: child,
    ),
  );
}
