import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:subway_seat/models/user_model.dart';
import 'package:subway_seat/repositories/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<UserModel> user = UserModel().obs;

  Future<UserModel?> loginUser(String uid) async {
    UserModel? userData = await UserRepository.getUserData(uid);
    if (userData != null) {
      user(userData);
    }
    return userData;
  }

  //구글 로그인
  Future<UserCredential> signInWithGoogle() async {
    return await UserRepository.signInWithGoogle();
  }

  //게스트 로그인
  Future signInWithGuest(String email, String password) async {
    await UserRepository().signUpWithEmailAndPassword(email, password);
  }

  //회원가입
  Future<void> signUp(UserModel userData) async {
    await UserRepository.signup(userData);
    await loginUser(userData.uid!);
    // print('uid야 ${user.value.uid}');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    user();
    // studyTime == null;
  }
}
