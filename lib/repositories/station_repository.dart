import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subway_seat/helpers/open_alert_dialog.dart';
import 'package:subway_seat/models/station_model.dart';
import 'package:subway_seat/models/user_model.dart';

class StationRepository {
  static Future<UserModel?> getUserData(String uid) async {
    print('찾는 uid = ${uid}');
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();
    // print('유저 로그인 완료');
    if (data.size == 0) {
      print('데이터 없음');
      return null;
    } else {
      //데이터 있음
      print(data.docs.first.data());
      return UserModel.fromJson(data.docs.first.data());
    }
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

  Future<void> uploadStation(StationModel stationModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('station')
          .doc(stationModel.name)
          .set(stationModel.toJson());
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
