import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart'; // GetX
import 'package:new_team4_app/customerPage/customerInsert.dart';
import 'package:new_team4_app/customerPage/customerMessage.dart';
import 'package:new_team4_app/customerPage/customerUpdate.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  TextEditingController numberIdController = TextEditingController(); // delete용
  TextEditingController searchController =
      TextEditingController(); // search Controller

  late List data; // list
  late String results; // delete

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
    setState(() {
      numberIdController.text = CustomerMessage.numberId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedf2fb),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(CustomerInsert());
        },
        label: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // appbar 뒤로가기 버튼 색깔 변경
        backgroundColor: const Color(0xffedf2fb),
        elevation: 0, // appbar 밑에 그림자 제거
        title: const Text(
          '고객관리',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        child: Center(
          child: data.isEmpty // 화면 다 그리면 실행하기 때문에
              ? const Text(
                  '데이터가 없습니다.', // 로딩중일때...
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // index : 저번에 position 썼던 것처럼 data에 몇 번째인지 알기 위해
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          //모서리를 둥글게 하기 위해 사용
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                  labelText: "Search",
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    data[index]['numberId'].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.dashed,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      CustomerMessage.numberId =
                                          data[index]['numberId'];
                                      CustomerMessage.gender =
                                          data[index]['gender'];
                                      CustomerMessage.car = data[index]['car'];
                                      CustomerMessage.reality =
                                          data[index]['reality'];
                                      CustomerMessage.child_num =
                                          data[index]['child_num'];
                                      CustomerMessage.income_total =
                                          data[index]['income_total'];
                                      CustomerMessage.income_type =
                                          data[index]['income_type'];
                                      CustomerMessage.edu_type =
                                          data[index]['edu_type'];
                                      CustomerMessage.family_type =
                                          data[index]['family_type'];
                                      CustomerMessage.house_type =
                                          data[index]['house_type'];
                                      CustomerMessage.days_birth =
                                          data[index]['days_birth'];
                                      CustomerMessage.days_employed =
                                          data[index]['days_employed'];
                                      CustomerMessage.work_phone =
                                          data[index]['work_phone'];
                                      CustomerMessage.phone =
                                          data[index]['phone'];
                                      CustomerMessage.email =
                                          data[index]['email'];
                                      CustomerMessage.family_size =
                                          data[index]['family_size'];
                                      CustomerMessage.begin_month =
                                          data[index]['begin_month'];
                                      Get.to(CustomerUpdate());
                                    },
                                    icon: Image.asset(
                                      'images/pen.png',
                                      width: 23,
                                      height: 23,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _deleteShowDialog(context);
                                    },
                                    icon: Image.asset(
                                      'images/trash.png',
                                      width: 23,
                                      height: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '성별 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['gender'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '차량소유여부 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['car'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '부동산소유여부 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['reality'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '자녀 수 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['child_num'].toString()),
                                  Text('명'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '연간소득 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['income_total'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '소득분류 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['income_type'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '교육수준 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['edu_type'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '결혼여부 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['family_type'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '생활방식 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['house_type'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '나이 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['days_birth'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '경력 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['days_employed'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '업무용전화소유여부 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['work_phone'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '전화소유여부 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['phone'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '이메일소유여부 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['email'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '가족규모 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['family_size'].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    '신용카드발급월 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(data[index]['begin_month'].toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
        ),
      ),
    );
  }

  // Insert
  Future<String> getJSONData() async {
    var url = Uri.parse('http://localhost:8080/Flutter/team_new4_card.jsp');
    var response = await http.get(url); // await니까 대기 했다가 build에서 화면 그리면 실행함
    setState(() {
      var dataConvertedJSON = json.decode(
          utf8.decode(response.bodyBytes)); // reponse에 내용 있는 부분 ---> body
      List result = dataConvertedJSON['results'];
      data.addAll(result); // add는 하나씩, addAll은 전체 다
    });
    return response.body;
  }

// Delete
  deleteJSONData() async {
    print(CustomerMessage.numberId);
    var url = Uri.parse(
        'http://localhost:8080/Flutter/team_new4_card_delete.jsp?numberId=${CustomerMessage.numberId}');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      results = dataConvertedJSON['results'];
    });
    // if (results == 'OK') {
    //   _deleteShowDialog(context);
    // } else {
    //   deleteErrorSnackBar(context);
    // }
  }

  _deleteShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text('삭제'),
              content: Text('해당 고객을 삭제하시겠습니까?'),
              actions: [
                CupertinoDialogAction(
                  child: Text('취소'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text('확인'),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    deleteJSONData();
                    // Get.to(TabbarPage());
                  },
                ),
              ],
            ));
  }

  deleteErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 정보 삭제에 문제가 발생 하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // >>> END <<<


