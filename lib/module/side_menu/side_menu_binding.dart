import 'package:get/get.dart';
import 'package:rs_ui/module/prediksi/prediksi_controller.dart';
import 'package:rs_ui/module/side_menu/side_menu_controller.dart';

class SideMenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideMenuController>(() => SideMenuController());
    Get.lazyPut<PrediksiController>(() => PrediksiController());
  }
}
