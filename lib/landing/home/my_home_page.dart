import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subway_seat/helpers/analytics.dart';
import 'package:subway_seat/root.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/main_button.dart';
import 'package:subway_seat/widgets/title_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget mainContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '좌석을 주고,\n좌석을 받고',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: CustomColors.blackText,
              fontWeight: FontWeight.bold,
              height: 1,
              fontSize: 55,
            ),
          ),
          SizedBox(height: 30),
          Text(
            '오늘만큼은 지하철에 앉아서 출근하고 싶을 때,\n좌석에 앉아서 해야만 하는 작업이 있을 때,',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: CustomColors.greyText,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget startButton() {
    return MainButton(
      buttonText: '지금 바로 시작하기',
      onTap: () {
        Analytics().logEvent('login_button', null);
        Get.to(() => const Root());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: TitleText(text: '좌주좌받'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              mainContent(),
              startButton(),
            ],
          ),
        ),
      ),
    );
  }
}
