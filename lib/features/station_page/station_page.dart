import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:subway_seat/helpers/open_alert_dialog.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/title_text.dart';

class StationPage extends StatefulWidget {
  final String? stationCode;
  final String? isUpward;
  StationPage({super.key, this.stationCode, this.isUpward});

  @override
  State<StationPage> createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  @override
  void initState() {
    searchTime(widget.stationCode!, widget.isUpward!);
    super.initState();
  }

  bool isLoading = true;

  List<List<String>> trainInfoList = [];
  String subwayApiKey = '4a687773456a79653737634c46526b';
  String serviceUrl = '//openAPI.seoul.go.kr:8088';

  Future<List<List<String>>> searchTime(
      String stationCode, String isUpward) async {
    print('코드는 ${stationCode}');
    // String apiUrl =
    //     '${serviceUrl}/${subwayApiKey}/json/SearchSTNTimeTableByIDService/1/5/2561/1/1/';
    String apiUrl =
        '${serviceUrl}/${subwayApiKey}/json/SearchSTNTimeTableByIDService/1/120/${stationCode}/1/${isUpward}';
    print(apiUrl);
    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      // print(response.body);
      List<List<String>> trainInfos = [];
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> rows = data['SearchSTNTimeTableByIDService']['row'];

      for (var row in rows) {
        String arrivalTime = row['ARRIVETIME'];
        String trainNo = row['TRAIN_NO'];
        trainInfos.add([arrivalTime, trainNo]);
      }
      print('열차 시간 정보 ${trainInfos}');
      trainInfoList = trainInfos;
      setState(() {
        isLoading = false; // 로딩 완료
      });
      return trainInfos;
    } else {
      setState(() {
        isLoading = false; // 로딩 완료
      });
      throw openAlertDialog(
          title: '열차 정보 로드에 실패했습니다.',
          content: '에러코드: ${response.statusCode.toString()}');
    }
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: TitleText(
        text: '역 선택',
      ),
    );
  }

  Widget _timeListView() {
    return ListView.builder(
      itemCount: trainInfoList.length,
      itemBuilder: (context, index) {
        return _timeCard(index);
      },
    );
  }

  Widget _timeCard(int index) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(
          '도착시간 : ${trainInfoList[index][0]}, 열차코드 : ${trainInfoList[index][1]}',
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
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // 로딩 중이면 로딩 표시
          : _timeListView(),
    );
  }
}
