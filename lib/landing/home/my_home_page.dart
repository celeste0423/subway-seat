import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subway_seat/helpers/analytics.dart';
import 'package:subway_seat/root.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/main_button.dart';
import 'package:subway_seat/widgets/text_field_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Image.asset(
          'assets/icons/logo.png',
          height: 40,
        ),
      ),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.only(right: 30),
          onPressed: () {
            Analytics().logEvent('login_button', null);
            Get.to(() => const Root());
          },
          child: Text(
            '로그인',
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
      padding: const EdgeInsets.symmetric(vertical: 30),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image.asset(
              'assets/icons/img.png',
              width: double.infinity,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image.asset(
              'assets/icons/img_1.png',
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdSubContent() {
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
                  text: '좌석을 ',
                ),
                TextSpan(
                  text: '주고 받고',
                  style: TextStyle(
                    color: CustomColors.mainBlue,
                  ),
                ),
                TextSpan(
                  text: ', 양보 스탬프 모으기 ',
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            '스탬프를 사용하면 좌석을 양보받고,\n좌석을 양보하면 스탬프를 받을 수 있어요.\n\n스탬프를 모아서 리워드를 획득하세요.',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: CustomColors.greyText,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image.asset(
              'assets/icons/img_2.png',
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget secondStartButton() {
    return Column(
      children: [
        SizedBox(height: 30),
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
                text: '양보 할수록 양보 받는',
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Text(
          '모두가 함께하는\n공평한 지하철 문화를 꿈꾸고 있어요.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors.greyText,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: MainButton(
            buttonText: '지금 바로 시작하기',
            onTap: () {
              Analytics().logEvent('login_button', null);
              Get.to(() => const Root());
            },
          ),
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: [
        SizedBox(height: 30),
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
                text: '관심이 있다면',
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Text(
          '안녕하세요 대학생 창업학회 소속\n창업팀 좌주좌받입니다.\n\n저희는 지하철 자리 부족으로 매번 서서 가야만 하는\n문제를 해결하기 위해 MVP서비스를 만들어\n실험을 진행하고 있습니다.\n\n여러 고객 인터뷰도 진행했지만\n프로덕트 자체에 대한 더 솔직한 이야기도 들어보고 싶습니다.\n저희 프로덕트에 관심이 있다면 아래 익명 의견란에\n프로덕트에 관한 의견을 남겨주세요!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors.greyText,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: TextFieldBox(
            textEditingController: textEditingController,
            hintText: '프로덕트에 대한 의견을 남겨주세요.',
            backgroundColor: CustomColors.lightGreyBackground,
          ),
        ),
      ],
    );
  }

  Widget bottomContent() {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          '본 서비스는 데모 서비스입니다. (2024.05)',
          style: TextStyle(
            color: CustomColors.greyText,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 20),
        Image.asset('assets/icons/logo.png'),
        SizedBox(height: 20),
        CupertinoButton(
          onPressed: () {},
          child: Image.asset('assets/icons/instagram.png'),
        ),
        SizedBox(height: 30),
      ],
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
              startButton(),
              subContent(),
              secondSubContent(),
              thirdSubContent(),
              secondStartButton(),
              // _textField(),
              bottomContent(),
            ],
          ),
        ),
      ),
    );
  }
}
