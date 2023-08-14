import 'package:get/get.dart';

enum Screen { prediksi, inputData, prediksiLamaRawat, home }

class SideMenuController extends GetxController {
  final currentScreen = Screen.home.obs;
}
