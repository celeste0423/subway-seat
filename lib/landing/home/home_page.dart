import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subway_seat/root.dart';
import 'package:subway_seat/widgets/main_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget loginButton() {
    return MainButton(
      buttonText: '로그인',
      onTap: () {
        Get.to(() => Root());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('좌주좌받'),
      ),
      body: Column(
        children: [
          loginButton(),
        ],
      ),
    );
  }
}
