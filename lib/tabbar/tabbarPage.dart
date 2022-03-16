import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:new_team4_app/customerPage/customerList.dart';
import 'package:new_team4_app/homePage/homePage.dart';
import 'package:new_team4_app/newsPage/newsList.dart';
import 'package:get/get.dart'; // GetX

class TabbarPage extends StatefulWidget {
  String? email;
  TabbarPage({Key? key, this.email}) : super(key: key);

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> with TickerProviderStateMixin {
  TabController? _tabController;
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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        // useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["고객관리", "Home", "News"],
        icons: const [
          Icons.people_alt,
          Icons.home,
          Icons.tv,
        ],

        // 옵션) 아이콘 위에 뱃지 (사용하지는 않지만 탭바 갯수와 맞춰줘야 됨)
        badges: const [null, null, null],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.blue[600],
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: const Color(0xff90caf9), // 탭 선택했을 때 동그란 배경 컬러
        tabIconSelectedColor: Colors.white, // 탭 선택했을 때 아이콘 컬러
        tabBarColor: const Color(0xffedf2fb), // 탭바 컬러
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // 손으로 밀어서 페이지 넘기는 건 적용 되지 않게
        controller: _tabController,
        children: [
          CustomerList(),
          HomePage(),
          NewsList(),
        ],
      ),
    );
  }
}
