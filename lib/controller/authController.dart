// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // GetX
// import 'package:new_team4_app/homePage/homePage.dart';
// import 'package:new_team4_app/login/loginPage.dart';
// import 'package:new_team4_app/newsPage/newsList.dart';
// import 'package:new_team4_app/tabbar/tabbarPage.dart';

// class AuthController extends GetxController {
//   static AuthController instance = Get.find();
//   late Rx<User?> _user;
//   FirebaseAuth auth = FirebaseAuth.instance;

//   @override
//   void onReady() {
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);

//     _user.bindStream(auth.userChanges());
//     ever(_user, _initalScreen);
//   }

//   _initalScreen(User? user) {
//     if (user != null) {
//       Get.offNamed('/tab', arguments: user.email);
//     } else {
//       print('Login page');
//       Get.offAll(const LoginPage());
//     }
//   }

//   // 회원가입
//   void register(String email, String password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       Get.snackbar(
//         '가입완료',
//         '회원가입이 완료되었습니다.',
//         colorText: Colors.white,
//         backgroundColor: Colors.black54,
//         snackPosition: SnackPosition.TOP,
//         duration: const Duration(
//           seconds: 2,
//         ),
//       );
//       Get.offAll(const LoginPage());
//     } catch (e) {
//       Get.snackbar(
//         'User',
//         'Users',
//         colorText: Colors.white,
//         backgroundColor: Colors.black54,
//         snackPosition: SnackPosition.TOP,
//         titleText: const Text(
//           '생성실패',
//           style: TextStyle(color: Colors.white),
//         ),
//         messageText: const Text(
//           '계정이 존재합니다',
//           style: TextStyle(color: Colors.white),
//         ),
//       );
//     }
//   }

//   // 로그인
//   void login(String email, String password) async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//       Get.snackbar(
//         '로그인 완료',
//         '$email님 환영합니다.',
//         colorText: Colors.white,
//         backgroundColor: Colors.black54,
//         snackPosition: SnackPosition.TOP,
//         duration: const Duration(
//           seconds: 2,
//         ),
//       );
//     } catch (e) {
//       Get.snackbar(
//         '뷁뷁',
//         '뷁뷁',
//         colorText: Colors.white,
//         backgroundColor: Colors.black54,
//         snackPosition: SnackPosition.TOP,
//         titleText: const Text(
//           '로그인 실패',
//           style: TextStyle(color: Colors.white),
//         ),
//         messageText: const Text(
//           '계정 및 비밀번호가 일치하지 않습니다.',
//           style: TextStyle(color: Colors.white),
//         ),
//       );
//     }
//   }

//   // 로그아웃
//   void logOut() async {
//     await auth.signOut();
//   }
// }
