import 'package:get/get.dart';
import 'package:rs_ui/module/prediksi/prediksi_screen.dart';
import 'package:rs_ui/module/side_menu/side_menu.dart';
import 'package:rs_ui/module/side_menu/side_menu_binding.dart';
import 'package:rs_ui/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: Routes.sideMenu,
        page: () => SideMenu(),
        binding: SideMenuBinding()),
  ];
}
