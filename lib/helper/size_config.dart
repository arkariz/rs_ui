import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;

  SizeConfig(this.context);

  double getHeight() {
    return MediaQuery.of(context).size.height;
  }

  double getWidth() {
    return MediaQuery.of(context).size.width;
  }
}
