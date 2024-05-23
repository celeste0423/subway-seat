import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/title_text.dart';

class StationSelectPage extends StatelessWidget {
  StationSelectPage({super.key});

  List<List<dynamic>> stationList = [
    ['진접(경복대)', 405],
    ['오남', 406],
    ['별내별가람', 408],
    ['당고개', 409],
    ['상계', 410],
    ['노원', 411],
    ['창동', 412],
    ['쌍문', 413],
    ['수유(강북구청)', 414],
    ['미아(서울사이버대학)', 415],
    ['미아사거리', 416],
    ['길음', 417],
    ['성신여대입구(돈암)', 418],
    ['한성대입구(삼선교)', 419],
    ['혜화', 420],
    ['동대문', 421],
    ['동대문역사문화공원(DDP)', 422],
    ['충무로', 423],
    ['명동(우리금융타운)', 424],
    ['회현(남대문시장)', 425],
    ['서울역', 426],
    ['숙대입구(갈월)', 427],
    ['삼각지', 428],
    ['신용산(아모레퍼시픽)', 429],
    ['이촌(국립중앙박물관)', 430],
    ['동작(현추원)', 431],
    ['총신대입구(이수)', 432],
    ['사당', 433],
    ['남태령', 434],
    ['선바위', 435],
    ['경마공원', 436],
    ['대공원(서울랜드)', 437],
    ['과천', 438],
    ['정부과천청사', 439],
    ['인덕원', 440],
    ['평촌(한림대성심병원)', 441],
    ['범계', 442],
    ['금정', 443],
    ['산본(원광대산본병원)', 444],
    ['수리산', 445],
    ['대야미', 446],
    ['반월', 447],
    ['상록수(안산대학교)', 448],
    ['한대앞', 449],
    ['중앙(서울예술대학교)', 450],
    ['고잔(고대안산병원)', 451],
    ['초지(신안산대학교)', 452],
    ['안산', 453],
    ['신길온천', 454],
    ['정왕(한국공학대학교)', 455],
    ['오이도', 456],
  ];

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: TitleText(
        text: '역 선택',
      ),
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
      onPressed: () {},
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
      body: _stationListView(),
    );
  }
}
