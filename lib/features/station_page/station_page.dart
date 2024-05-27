import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:subway_seat/features/seat_page/seat_page.dart';
import 'package:subway_seat/helpers/analytics.dart';
import 'package:subway_seat/helpers/open_alert_dialog.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/title_text.dart';

class StationPage extends StatefulWidget {
  final String? stationName;
  final List<List<String>>? trainInfoList;

  StationPage({super.key, this.stationName, this.trainInfoList});

  @override
  State<StationPage> createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  @override
  void initState() {
    // searchTrain(widget.stationCode!, widget.isUpward!);
    super.initState();
  }

  bool isLoading = false;

  // List<List<String>> trainInfoList = [];
  String subwayApiKey = '4a687773456a79653737634c46526b';
  String serviceUrl = 'http://openAPI.seoul.go.kr:8088';
  var headers = {
    'http-equiv': "Content-Security-Policy",
    'content': "upgrade-insecure-requests",
  };

  Future<List<List<String>>> searchTrain(
      String stationCode, String isUpward) async {
    print('코드는 ${stationCode}');
    String apiUrl =
        '${serviceUrl}/${subwayApiKey}/json/SearchSTNTimeTableByIDService/1/120/${stationCode}/1/${isUpward}';
    print(apiUrl);
    http.Response response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );
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
      // trainInfoList = trainInfos;
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
        text: widget.stationName!,
      ),
    );
  }

  Widget _timeListView() {
    return ListView.builder(
      itemCount: widget.trainInfoList!.length,
      itemBuilder: (context, index) {
        return _timeCard(index);
      },
    );
  }

  Widget _timeCard(int index) {
    return CupertinoButton(
      onPressed: () {
        Get.to(() => SeatPage(
              trainCode: widget.trainInfoList![index][1],
            ));
      },
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: CustomColors.lightGreyBackground,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '도착시간 : ${widget.trainInfoList![index][0]}',
              style: TextStyle(
                fontSize: 25,
                color: CustomColors.blackText,
              ),
            ),
            Text(
              '열차코드 : ${widget.trainInfoList![index][1]}',
              style: TextStyle(
                fontSize: 15,
                color: CustomColors.blackText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Analytics().logEvent('station_page_open', null);
    return Scaffold(
      appBar: _appBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // 로딩 중이면 로딩 표시
          : _timeListView(),
    );
  }
}
