import 'package:flutter/material.dart';

class SimpleListView extends Container {
  SimpleListView({List<Widget> items})
      : super(
            height: 650,
            child: ListView(
              children: items,
            ));
}
