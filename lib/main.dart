import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stylesage/features/Authentication/screens/splash/splash_screen.dart';
import 'package:stylesage/features/Shop/screens/cancel_appointment.dart/CancelAppointmentScreen.dart';
import 'package:stylesage/navigation_menu.dart';
import 'package:stylesage/utils/theme/theme.dart';

void main() {
  //Todo: Add Widget binding
  //Todo: init local storage
  //Todo: await native splash
  //Todo: initilize the firebase
  //Todo: initilize the Authentication
  final controller =
      Get.put(NavigationController()); //initilizing the navigation controller
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //     themeMode: ThemeMode.light,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      home: NavigationMenu(),
    );
  }
}
