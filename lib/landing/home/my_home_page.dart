import 'package:flutter/cupertino.dart';
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
  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: TitleText(text: '좌주좌받'),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.only(right: 30),
          onPressed: () {
            Analytics().logEvent('login_button', null);
            Get.to(() => const Root());
          },
          child: Text(
            '바로 시작하기',
            style: TextStyle(
              color: CustomColors.greyText,
            ),
          ),
        ),
      ],
    );
  }

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
              height: 1.1,
              fontSize: 50,
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
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: CustomColors.greyBackground,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ],
      ),
    );
  }

  Widget subContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 7,
            width: 70,
            margin: const EdgeInsets.symmetric(vertical: 30),
            color: CustomColors.mainBlack,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: CustomColors.blackText,
                fontWeight: FontWeight.bold,
                height: 1.1,
                fontSize: 30,
              ),
              children: [
                TextSpan(
                  text: '내가 ',
                ),
                TextSpan(
                  text: '타는 역',
                  style: TextStyle(
                    color: CustomColors.mainBlue,
                  ),
                ),
                TextSpan(
                  text: '에서 좌석 예약해두기 ',
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            '4호선 혜화역에서 내리는 "양보인"을 확인하세요.\n내가 탄 열차의 양보 좌석 위치를 찾아가세요.',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: CustomColors.greyText,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: CustomColors.greyBackground,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondSubContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 7,
            width: 70,
            margin: const EdgeInsets.symmetric(vertical: 30),
            color: CustomColors.mainBlack,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: CustomColors.blackText,
                fontWeight: FontWeight.bold,
                height: 1.1,
                fontSize: 30,
              ),
              children: [
                TextSpan(
                  text: '내가 ',
                ),
                TextSpan(
                  text: '내리는 역',
                  style: TextStyle(
                    color: CustomColors.mainBlue,
                  ),
                ),
                TextSpan(
                  text: '에서 좌석 양보하기 ',
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            '받은 양보를 돌려주세요.\n내가 내리는 열차의 양보 좌석 위치를 표시하세요.',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: CustomColors.greyText,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: CustomColors.greyBackground,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ],
      ),
    );
  }

  Widget startButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: MainButton(
        buttonText: '지금 바로 시작하기',
        onTap: () {
          Analytics().logEvent('login_button', null);
          Get.to(() => const Root());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              mainContent(),
              subContent(),
              secondSubContent(),
              startButton(),
            ],
          ),
        ),
      ),
    );
  }
}
