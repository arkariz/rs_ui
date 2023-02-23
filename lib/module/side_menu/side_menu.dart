import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rs_ui/helper/size_config.dart';
import 'package:rs_ui/module/input_data/input_data_screen.dart';
import 'package:rs_ui/module/prediksi/prediksi_screen.dart';
import 'package:rs_ui/module/side_menu/side_menu_controller.dart';

class SideMenu extends GetView<SideMenuController> {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig(context).getHeight(),
        width: SizeConfig(context).getWidth(),
        child: Row(
          children: [
            sideMenuWidget(),
            screen(),
          ],
        ),
      ),
    );
  }

  Widget screen() {
    return Obx(
      () => Flexible(
        flex: 5,
        child: controller.currentScreen.value == Screen.prediksi
            ? const PrediksiScreen()
            : const InputDataScreen(),
      ),
    );
  }

  Widget sideMenuWidget() {
    return Flexible(
      flex: 1,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 20,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.local_hospital,
                      size: 30,
                      color: Colors.blue,
                    ),
                    Text(
                      "Health Care",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                sideMenuItem(
                  Icons.switch_access_shortcut_add_outlined,
                  "Prediksi",
                  Screen.prediksi,
                ),
                const SizedBox(height: 10),
                sideMenuItem(
                  Icons.input,
                  "Input Data",
                  Screen.inputData,
                )
              ],
            ),
          )),
    );
  }

  Widget sideMenuItem(IconData icon, String title, Screen screen) {
    return InkWell(
      onTap: () {
        controller.currentScreen(screen);
      },
      child: Obx(() {
        var isActive = controller.currentScreen.value == screen ? true : false;

        return Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 7),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: isActive ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        );
      }),
    );
  }
}
