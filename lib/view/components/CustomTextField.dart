import 'package:flutter/material.dart';

class CustomTextField extends Container {
  CustomTextField({String hint, String title})
      : super(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hint,
                ),
              ),
            ],
          ),
        );
}
