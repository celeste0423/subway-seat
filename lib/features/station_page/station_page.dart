import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/title_text.dart';

class StationPage extends StatelessWidget {
  StationPage({super.key});

  String subwayApiKey = '4a687773456a79653737634c46526b';

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
