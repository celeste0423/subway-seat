import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subway_seat/features/login/auth_controller.dart';
import 'package:subway_seat/features/login/login_page.dart';
import 'package:subway_seat/features/station_select/station_select_page.dart';
import 'package:subway_seat/models/user_model.dart';
import 'package:subway_seat/widgets/full_size_loading_indicator.dart';

class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          return FutureBuilder<UserModel?>(
              future: controller.loginUser(user.data!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const FullSizeLoadingIndicator();
                } else {
                  return Obx(() {
                    if (controller.user.value.uid != null) {
                      return StationSelectPage();
                    } else {
                      UserModel userData = UserModel(
                        uid: user.data!.uid,
                        email: user.data!.email,
                        createdAt: DateTime.now(),
                      );
                      AuthController.to.signUp(userData);
                    }
                    return StationSelectPage();
                  });
                }
              });
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
