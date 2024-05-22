import 'package:flutter/material.dart';
import 'package:subway_seat/features/login/auth_controller.dart';

class StationSelectPage extends StatelessWidget {
  const StationSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('내 이메일 : ${AuthController.to.user.value.email}'),
      ),
    );
  }
}
