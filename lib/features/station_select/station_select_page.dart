import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subway_seat/features/station_page/station_page.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/title_text.dart';

class StationSelectPage extends StatefulWidget {
  StationSelectPage({super.key});

  @override
  State<StationSelectPage> createState() => _StationSelectPageState();
}

class _StationSelectPageState extends State<StationSelectPage> {
  String isUpward = '1';
  List<List<dynamic>> stationList = [
    ['진접(경복대)', '0405'],
    ['오남', '0406'],
    ['별내별가람', '0408'],
    ['당고개', '0409'],
    ['상계', '0410'],
    ['노원', '0411'],
    ['창동', '0412'],
    ['쌍문', '0413'],
    ['수유(강북구청)', '0414'],
    ['미아(서울사이버대학)', '0415'],
    ['미아사거리', '0416'],
    ['길음', '0417'],
    ['성신여대입구(돈암)', '0418'],
    ['한성대입구(삼선교)', '0419'],
    ['혜화', '0420'],
    ['동대문', '0421'],
    ['동대문역사문화공원(DDP)', '0422'],
    ['충무로', '0423'],
    ['명동(우리금융타운)', '0424'],
    ['회현(남대문시장)', '0425'],
    ['서울역', '0426'],
    ['숙대입구(갈월)', '0427'],
    ['삼각지', '0428'],
    ['신용산(아모레퍼시픽)', '0429'],
    ['이촌(국립중앙박물관)', '0430'],
    ['동작(현추원)', '0431'],
    ['총신대입구(이수)', '0432'],
    ['사당', '0433'],
    ['남태령', '0434'],
    ['선바위', '0435'],
    ['경마공원', '0436'],
    ['대공원(서울랜드)', '0437'],
    ['과천', '0438'],
    ['정부과천청사', '0439'],
    ['인덕원', '0440'],
    ['평촌(한림대성심병원)', '0441'],
    ['범계', '0442'],
    ['금정', '0443'],
    ['산본(원광대산본병원)', '0444'],
    ['수리산', '0445'],
    ['대야미', '0446'],
    ['반월', '0447'],
    ['상록수(안산대학교)', '0448'],
    ['한대앞', '0449'],
    ['중앙(서울예술대학교)', '0450'],
    ['고잔(고대안산병원)', '0451'],
    ['초지(신안산대학교)', '0452'],
    ['안산', '0453'],
    ['신길온천', '0454'],
    ['정왕(한국공학대학교)', '0455'],
    ['오이도', '0456'],
  ];

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: TitleText(
        text: '역 선택',
      ),
    );
  }

  Widget _isUpwardSelect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          onPressed: () {
            setState(() {
              isUpward = '1';
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isUpward == '1'
                    ? CustomColors.mainBlue
                    : CustomColors.greyBackground,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              '상행선',
              style: TextStyle(
                color: isUpward == '1'
                    ? CustomColors.mainBlue
                    : CustomColors.greyBackground,
                fontSize: 12,
              ),
            ),
          ),
        ),
        CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          onPressed: () {
            setState(() {
              isUpward = '2';
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isUpward == '2'
                    ? CustomColors.mainBlue
                    : CustomColors.greyBackground,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              '하행선',
              style: TextStyle(
                color: isUpward == '2'
                    ? CustomColors.mainBlue
                    : CustomColors.greyBackground,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _stationListView() {
    return ListView.builder(
      itemCount: 51,
      itemBuilder: (context, index) {
        return _stationCard(index);
      },
    );
  }

  Widget _stationCard(int index) {
    return CupertinoButton(
      onPressed: () {
        Get.to(() => StationPage(
              stationCode: stationList[index][1].toString(),
              isUpward: isUpward,
            ));
      },
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(
          stationList[index][0],
          style: TextStyle(
            fontSize: 20,
            color: CustomColors.blackText,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            _isUpwardSelect(),
            Expanded(child: _stationListView()),
          ],
        ),
      ),
    );
  }
}
