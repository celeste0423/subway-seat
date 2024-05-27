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

  Widget _content() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/logo.png'),
          const SizedBox(height: 80),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: CustomColors.blackText,
                fontWeight: FontWeight.bold,
                height: 1.1,
                fontSize: 30,
              ),
              children: [
                TextSpan(
                  text: '앉아서 출근할 준비되셨나요?',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            '좌석을 양보하고, 양보받고',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColors.greyText,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '로그인에 실패하신다면\n사파리나 크롬브라우저를 이용해주세요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColors.greyText,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget loginTab() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const GoogleLoginButton(),
          const SizedBox(height: 30),
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
          _content(),
          loginTab(),
        ],
      ),
    );
  }
}
