import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GoogleLoginButton(),
          Visibility(
            visible: googleUser != null,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
