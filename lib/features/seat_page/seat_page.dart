import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subway_seat/features/ticket_page/ticket_page.dart';
import 'package:subway_seat/helpers/open_alert_dialog.dart';
import 'package:subway_seat/models/seat_model.dart';
import 'package:subway_seat/repositories/seat_repository.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/title_text.dart';
import 'package:uuid/uuid.dart';

class SeatPage extends StatefulWidget {
  final String? trainCode;

  SeatPage({super.key, this.trainCode});

  @override
  State<SeatPage> createState() => _StationPageState();
}

class _StationPageState extends State<SeatPage> {
  @override
  void initState() {
    // searchTrain(widget.stationCode!, widget.isUpward!);
    super.initState();
  }

  bool isLoading = false;
  int carNum = 1;
  Uuid uuid = Uuid();

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: TitleText(
        text: widget.trainCode!,
      ),
    );
  }

  Widget _carNumRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        carNum != 1
            ? CupertinoButton(
                onPressed: () {
                  setState(() {
                    carNum--;
                  });
                },
                child: Icon(
                  Icons.arrow_left,
                  size: 35,
                  color: CustomColors.mainBlue,
                ),
              )
            : SizedBox(
                width: 5,
              ),
        Text(
          '${carNum}호차',
          style: TextStyle(fontSize: 25, color: CustomColors.mainBlack),
        ),
        carNum != 10
            ? CupertinoButton(
                onPressed: () {
                  setState(() {
                    carNum++;
                  });
                },
                child: Icon(
                  Icons.arrow_right,
                  size: 35,
                  color: CustomColors.mainBlue,
                ),
              )
            : SizedBox(
                width: 5,
              ),
      ],
    );
  }

  Widget _seatListView() {
    return SingleChildScrollView(
      child: StreamBuilder<List<SeatModel?>>(
        stream: SeatRepository().getSeatListStream(
          widget.trainCode!,
          carNum.toString(),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> availableSeats =
                snapshot.data!.map((seat) => seat!.seatNum!).toList();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _door(),
                    _seatCard(availableSeats.contains('L1'), 'L1'),
                    _seatCard(availableSeats.contains('L2'), 'L2'),
                    _seatCard(availableSeats.contains('L3'), 'L3'),
                    _seatCard(availableSeats.contains('L4'), 'L4'),
                    _seatCard(availableSeats.contains('L5'), 'L5'),
                    _seatCard(availableSeats.contains('L6'), 'L6'),
                    _seatCard(availableSeats.contains('L7'), 'L7'),
                    _door(),
                    _seatCard(availableSeats.contains('L8'), 'L8'),
                    _seatCard(availableSeats.contains('L9'), 'L9'),
                    _seatCard(availableSeats.contains('L10'), 'L10'),
                    _seatCard(availableSeats.contains('L11'), 'L11'),
                    _seatCard(availableSeats.contains('L12'), 'L12'),
                    _seatCard(availableSeats.contains('L13'), 'L13'),
                    _seatCard(availableSeats.contains('L14'), 'L14'),
                    _door(),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: CustomColors.mainBlack,
                    ),
                    Text(
                      '열차 진행 방향',
                      style: TextStyle(
                        color: CustomColors.mainBlack,
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: CustomColors.mainBlack,
                    ),
                  ],
                ),
                Column(
                  children: [
                    _door(),
                    _seatCard(availableSeats.contains('R1'), 'R1'),
                    _seatCard(availableSeats.contains('R2'), 'R2'),
                    _seatCard(availableSeats.contains('R3'), 'R3'),
                    _seatCard(availableSeats.contains('R4'), 'R4'),
                    _seatCard(availableSeats.contains('R5'), 'R5'),
                    _seatCard(availableSeats.contains('R6'), 'R6'),
                    _seatCard(availableSeats.contains('R7'), 'R7'),
                    _door(),
                    _seatCard(availableSeats.contains('R8'), 'R8'),
                    _seatCard(availableSeats.contains('R9'), 'R9'),
                    _seatCard(availableSeats.contains('R10'), 'R10'),
                    _seatCard(availableSeats.contains('R11'), 'R11'),
                    _seatCard(availableSeats.contains('R12'), 'R12'),
                    _seatCard(availableSeats.contains('R13'), 'R13'),
                    _seatCard(availableSeats.contains('R14'), 'R14'),
                    _door(),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _seatCard(bool isSeat, String seatCode) {
    return CupertinoButton(
      onPressed: () {
        if (isSeat) {
          openAlertDialog(
            title: '신청하시겠습니까?',
            content: '좌석 양보를 신청하시겠습니까?',
            mainfunction: () {
              Get.back();
              Get.to(() => TicketPage(
                    carNum: carNum.toString(),
                    seatCode: seatCode,
                  ));
            },
          );
        } else {
          openAlertDialog(
            title: '양보하시겠습니까?',
            content: '좌석을 양보하시겠습니까?',
            mainfunction: () {
              SeatModel seatModel = SeatModel(
                seatId: uuid.v4(),
                trainCode: widget.trainCode,
                carNum: carNum.toString(),
                seatNum: seatCode,
                createdAt: DateTime.now(),
              );
              SeatRepository().uploadSeat(seatModel);
              Get.back();
              Get.to(() => TicketPage(
                    carNum: carNum.toString(),
                    seatCode: seatCode,
                  ));
            },
          );
        }
      },
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      alignment: Alignment.centerLeft,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: isSeat ? CustomColors.mainBlue : CustomColors.lightGreyText,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            seatCode,
            style: TextStyle(
              fontSize: 20,
              color: CustomColors.blackText,
            ),
          ),
        ),
      ),
    );
  }

  Widget _door() {
    return Container(
      color: CustomColors.mainBlack,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: Text(
        '입구',
        style: TextStyle(
          fontSize: 20,
          color: CustomColors.whiteText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _carNumRow(),
          Expanded(child: _seatListView()),
        ],
      ),
    );
  }
}
