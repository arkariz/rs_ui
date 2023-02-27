import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rs_ui/module/side_menu/side_menu.dart';
import 'package:rs_ui/routes/app_pages.dart';
import 'package:rs_ui/routes/app_routes.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.setFullScreen(true);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xFFF6F8FB),
      ),
      getPages: AppPages.routes,
      initialRoute: Routes.sideMenu,
    );
  }
}
