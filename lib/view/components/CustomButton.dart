import 'package:flutter/material.dart';

class CustomButton extends SizedBox {
  static final ButtonStyle SUCCESS = ElevatedButton.styleFrom(
    primary: Colors.green,
    onPrimary: Colors.white,
    onSurface: Colors.grey,
  );
  static final ButtonStyle ERROR = ElevatedButton.styleFrom(
    primary: Colors.red,
    onPrimary: Colors.white,
    onSurface: Colors.grey,
  );
  static final ButtonStyle DEFAULT = ElevatedButton.styleFrom(
    primary: Colors.blue,
    onPrimary: Colors.white,
    onSurface: Colors.grey,
  );
  CustomButton({Widget child, Function onPressed, ButtonStyle style})
      : super(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: child,
            style: style != null ? style : DEFAULT,
          ),
        );
}
