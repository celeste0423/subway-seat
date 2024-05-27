import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subway_seat/helpers/open_alert_dialog.dart';
import 'package:subway_seat/models/seat_model.dart';
import 'package:subway_seat/models/user_model.dart';

class SeatRepository {
  Future<List<SeatModel?>> getSeatList(String trainCode) async {
    List<SeatModel?> seatList = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('seat')
          .where('trainCode', isEqualTo: trainCode)
          .get();
      seatList = querySnapshot.docs.map(
        (doc) {
          return SeatModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
    } catch (e) {
      openAlertDialog(
        title: '열차 정보를 가져오는데 실패했습니다.',
        content: e.toString(),
      );
    }
    return seatList;
  }

  Stream<List<SeatModel?>> getSeatListStream(String trainCode, String carNum) {
    return FirebaseFirestore.instance
        .collection('seat')
        .where('trainCode', isEqualTo: trainCode)
        .where('carNum', isEqualTo: carNum)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return SeatModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
    }).handleError((e) {
      openAlertDialog(
        title: '열차 정보를 가져오는데 실패했습니다.',
        content: e.toString(),
      );
    });
  }

  Future<void> updateUserModel(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uid)
          .update(userModel.toJson());
    } catch (e) {
      openAlertDialog(title: '유저 모델 업데이트 중 오류 발생', content: e.toString());
    }
  }

  Future<void> uploadSeat(SeatModel seatModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('seat')
          .doc(seatModel.seatId)
          .set(seatModel.toJson());
    } catch (e) {
      openAlertDialog(title: '업로드 실패', content: e.toString());
    }
  }

  Future deleteUserModel(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uid)
          .collection('time')
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uid)
          .delete();
    } catch (e) {
      openAlertDialog(
          title: '계정 삭제에 실패했습니다. 에러메시지를 신고해주세요.', content: e.toString());
    }
  }
}
