import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_ui/widget/loading/spinner.dart';

import 'loading_controller.dart';

class LoadingWidget extends GetWidget<LoadingController> {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading
          ? WillPopScope(
              onWillPop: () => Future.value(false),
              child: FullScreenLoading(),
            )
          : const SizedBox();
    });
  }
}
