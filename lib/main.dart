import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX
import 'package:new_team4_app/customerPage/customerList.dart';

import 'package:new_team4_app/homePage/homePage.dart';
import 'package:new_team4_app/login/loginPage.dart';
import 'package:new_team4_app/map/mapsample.dart';
import 'package:new_team4_app/newsPage/newsList.dart';
import 'package:new_team4_app/tabbar/tabbarPage.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

// 메인
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CREDIT-M',
      debugShowCheckedModeBanner: false, // 왼쪽 상단의 debug 뱃지 제거
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffe0e9f8),
      ),
      home: const LoginPage(),
      getPages: [
        GetPage(name: '/tab', page: () => TabbarPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/customer', page: () => CustomerList()),
        GetPage(name: '/news', page: () => NewsList()),
        GetPage(name: '/map', page: () => MapSample())
      ],
    );
  }
}

// color값 code로 적는 방법!
// 0xff 뒤에 컬러값 넣어주면 됨
// 예시) #D3E5FF 이면 Color(0xffd3e5ff) <--- 이런 방식으로 사용
