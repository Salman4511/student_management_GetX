import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/login_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<LoginController>(
          builder: (loginController) {
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
