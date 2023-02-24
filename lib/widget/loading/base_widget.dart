import 'package:flutter/material.dart';
import 'package:rs_ui/widget/loading/loading_widget.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        LoadingWidget(),
      ],
    );
  }
}
