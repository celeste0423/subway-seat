import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:subway_seat/utils/custom_color.dart';
import 'package:subway_seat/widgets/google_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? googleUser;

  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: const String.fromEnvironment('GOOGLE_CLIENT_ID'),
  );

  @override
  void initState() {
    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      print('로그인 완료됨');
      setState(() {
        googleUser = account;
      });
      //로그인 성공, 유저정보 가져오기
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      //파이어베이스 인증 정보 로그인
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    });
    super.initState();
  }

  Widget loginTab() {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: CustomColors.mainBlue,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          GoogleLoginButton(),
          Visibility(
            visible: googleUser != null,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text('로그인이 완료되었습니다'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          loginTab(),
        ],
      ),
    );
  }
}
