import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_ui/module/input_data/input_data_screen.dart';
import 'package:rs_ui/module/prediksi/prediksi_screen.dart';

enum Screen { prediksi, inputData }

class SideMenuController extends GetxController {
  final currentScreen = Screen.prediksi.obs;
}
