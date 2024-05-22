import 'package:flutter/material.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart' as web;

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return (GoogleSignInPlatform.instance as web.GoogleSignInPlugin)
        .renderButton();
    // return GestureDetector(
    //   onTap: () async {
    //     print('구글 로그인 시도1');
    //     UserCredential? userCredential =
    //         await UserRepository.signInWithGoogle();
    //
    //     if (userCredential == '') {
    //       openAlertDialog(title: '로그인 실패');
    //     } else {
    //       print('(gog but) ${AuthController.to.user.value.email}');
    //     }
    //     Get.back();
    //   },
    //   child: Stack(
    //     children: [
    //       Container(
    //         height: 50,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(15),
    //           border: Border.all(color: Colors.black.withOpacity(0.2)),
    //         ),
    //         child: const Center(
    //           child: Text(
    //             'Google로 로그인',
    //             style: TextStyle(
    //               fontFamily: 'Roboto',
    //               fontSize: 15,
    //               fontWeight: FontWeight.w500,
    //               color: Colors.black,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 10,
    //         top: 10,
    //         child: Image.asset(
    //           'assets/icons/google.png',
    //           height: 30,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
