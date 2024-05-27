import 'package:flutter/material.dart';
import 'package:subway_seat/utils/custom_color.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key, this.carNum, this.seatCode});
  final String? carNum;
  final String? seatCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: CustomColors.mainBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            '해당 화면을 보여주고 자리를 교환하세요\n\n${carNum}호차 ${seatCode}',
            style: TextStyle(
              color: CustomColors.whiteText,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
