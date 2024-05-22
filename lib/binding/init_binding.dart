import 'package:get/get.dart';
import 'package:subway_seat/features/login/auth_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }

  // static additionalBinding() {
  //   Get.put(HomePageController(), permanent: true);
  //   Get.put(RoomListPageController(), permanent: true);
  //   // Get.put(RankingPage());
  //   Get.put(MyPageController());
  // }

  // void refreshHomePageController() {
  //   Get.delete<HomePageController>();
  //   Get.put(HomePageController(), permanent: true);
  // }

  // void refreshRoomListPageController() {
  //   Get.delete<RoomListPageController>();
  //   // RoomListPageController().dispose();
  // }
}
