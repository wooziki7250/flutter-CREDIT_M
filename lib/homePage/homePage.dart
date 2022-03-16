import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX
import 'package:new_team4_app/predictPage/predictPage.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  String? email = Get.arguments;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color(0xffedf2fb),
        elevation: 0, // appbar 밑에 그림자 제거
        title: const Text(
          'CREDIT-M',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/credit-M_logo_sp.png'),
              ),
              accountName: Text('$email님'),
              accountEmail: Text('CREDIT-M에 오신것을 환영합니다.'),
              decoration: BoxDecoration(
                color: Color(0xff347af0),
                borderRadius: const BorderRadius.only(),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.mp_sharp,
                color: Colors.black,
              ),
              title: Text('영업점 찾기'),
              onTap: () => Get.offNamed('/map', arguments: email),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: const Text('로그아웃'),
              onTap: () {
                // AuthController.instance.logOut();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xffedf2fb),
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              const Text(
                '신용카드 사용자의 데이터를 통해',
                style: TextStyle(fontSize: 15),
              ),
              const Text('연체 대금을 예측해 보세요!', style: TextStyle(fontSize: 15)),
              const SizedBox(
                height: 50,
              ),
              Image.asset('images/wondering.png'),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(PredictPage());
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff347af0),
                  shape: RoundedRectangleBorder(
                    // 모서리 모양
                    borderRadius: BorderRadius.circular(20.0), // 모서리 모양 둥글게
                  ),
                ),
                child: Container(
                  width: 160,
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text(
                    '연체 대금 예측',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
