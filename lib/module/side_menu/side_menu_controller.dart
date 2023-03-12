import 'package:get/get.dart';

enum Screen { prediksi, inputData, prediksiLamaRawat }

class SideMenuController extends GetxController {
  final currentScreen = Screen.prediksi.obs;
}
