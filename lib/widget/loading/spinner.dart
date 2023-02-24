import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rs_ui/helper/size_config.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig(context).getHeight(),
      width: SizeConfig(context).getWidth(),
      color: Colors.black.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadingAnimationWidget.inkDrop(color: Colors.blue, size: 45),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
