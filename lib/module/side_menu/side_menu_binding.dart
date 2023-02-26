import 'package:get/get.dart';
import 'package:rs_ui/module/input_data/input_data_controller.dart';
import 'package:rs_ui/module/prediksi/prediksi_controller.dart';
import 'package:rs_ui/module/side_menu/side_menu_controller.dart';
import 'package:rs_ui/widget/loading/loading_controller.dart';

class SideMenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingController>(() => LoadingController());
    Get.lazyPut<SideMenuController>(() => SideMenuController());
    Get.lazyPut<PrediksiController>(() => PrediksiController());
    Get.lazyPut<InputDataController>(() => InputDataController());
  }
}
