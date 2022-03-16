import 'dart:convert';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_team4_app/tabbar/tabbarPage.dart';
import 'package:flutter/cupertino.dart'; // 쿠퍼티노 디자인

class CustomerInsert extends StatefulWidget {
  const CustomerInsert({Key? key}) : super(key: key);

  @override
  _CustomerInsertState createState() => _CustomerInsertState();
}

class _CustomerInsertState extends State<CustomerInsert> {
  // TextField Controller
  TextEditingController numberIdController = TextEditingController();
  TextEditingController child_numController = TextEditingController();
  TextEditingController income_totalController = TextEditingController();
  TextEditingController days_birthController = TextEditingController();
  TextEditingController days_employedController = TextEditingController();
  TextEditingController family_sizeController = TextEditingController();
  TextEditingController begin_monthController = TextEditingController();

  // Radio Button
  var _genderResult;
  var _carResult;
  var _realityResult;
  var _income_typeResult;
  var _edu_typeResult;
  var _family_typeResult;
  var _house_typeResult;
  var _work_phoneResult;
  var _phoneResult;
  var _emailResult;

  // TextField와 Radio Button의 최종 결과값 저장하는 변수
  late String numberId;
  late String gender;
  late String car;
  late String reality;
  late String child_num;
  late String income_total;
  late String income_type;
  late String edu_type;
  late String family_type;
  late String house_type;
  late String days_birth;
  late String days_employed;
  late String work_phone;
  late String phone;
  late String email;
  late String family_size;
  late String begin_month;
  late String results;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffedf2fb),
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
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '1. 고객 ID',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: numberIdController,
                    decoration: InputDecoration(
                      labelText: '등록할 고객 ID를 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '2. 성별',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "MALE",
                      "FEMALE",
                    ],
                    // 버튼 값
                    buttonValues: [
                      "M",
                      "F",
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _genderResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '3. 차량소유여부',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "YES",
                      "NO",
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Y",
                      "N",
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _carResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '4. 부동산소유여부',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "YES",
                      "NO",
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Y",
                      "N",
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _realityResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '5. 자녀수',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: child_numController,
                    decoration: InputDecoration(
                      labelText: '자녀 수를 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '6. 연간 소득',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: income_totalController,
                    decoration: InputDecoration(
                      labelText: '연간 소득을 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '7. 소득분류',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "Commercial Associate",
                      "Working",
                      'State Servant',
                      'Pensioner',
                      'Student'
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Commercial Associate",
                      "Working",
                      'State Servant',
                      'Pensioner',
                      'Student'
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _income_typeResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                    horizontal: true,
                  ),
                  Text(
                    '8. 교육수준',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "Higher education",
                      "Secondary / secondary special",
                      'Incomplete higher',
                      'Lower secondary',
                      'Academic degree',
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Higher education",
                      "Secondary / secondary special",
                      'Incomplete higher',
                      'Lower secondary',
                      'Academic degree',
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _edu_typeResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                    horizontal: true,
                  ),
                  Text(
                    '9. 결혼여부',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "Married",
                      "Civil marriage",
                      'Separated',
                      'Single / not married',
                      'Widow',
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Married",
                      "Civil marriage",
                      'Separated',
                      'Single / not married',
                      'Widow',
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _family_typeResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                    horizontal: true,
                  ),
                  Text(
                    '10. 생활방식',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "Municipal apartment",
                      "House / apartment",
                      'With parents',
                      'Co-op apartment',
                      'Rented apartment',
                      'Office apartment',
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Municipal apartment",
                      "House / apartment",
                      'With parents',
                      'Co-op apartment',
                      'Rented apartment',
                      'Office apartment',
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _house_typeResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                    horizontal: true,
                  ),
                  Text(
                    '11. 출생일',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: days_birthController,
                    decoration: InputDecoration(
                      labelText: '출생일을 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '12. 업무 시작일',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: days_employedController,
                    decoration: InputDecoration(
                      labelText: '업무 시작일을 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '13. 업무용 전화 소유 여부',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "YES",
                      "NO",
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Y",
                      "N",
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _work_phoneResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '14. 전화 소유 여부',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "YES",
                      "NO",
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Y",
                      "N",
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _phoneResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '15. 이메일 소유 여부',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomRadioButton(
                    elevation: 0, // 버튼 그림자 제거
                    // 버튼 글자
                    buttonLables: [
                      "YES",
                      "NO",
                    ],
                    // 버튼 값
                    buttonValues: [
                      "Y",
                      "N",
                    ],
                    radioButtonValue: (value) {
                      setState(() {
                        _emailResult = value;
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.white,
                    enableShape: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '16. 가족 규모',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: family_sizeController,
                    decoration: InputDecoration(
                      labelText: '가족 규모를 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '17. 신용카드 발급 월',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: begin_monthController,
                    decoration: InputDecoration(
                      labelText: '신용카드 발급 월을 입력하세요.',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        numberId = numberIdController.text.toString();
                        gender = _genderResult.toString();
                        car = _carResult.toString();
                        reality = _realityResult.toString();
                        child_num = child_numController.text.toString();
                        income_total = income_totalController.text.toString();
                        income_type = _income_typeResult.toString();
                        edu_type = _edu_typeResult.toString();
                        family_type = _family_typeResult.toString();
                        house_type = _house_typeResult.toString();
                        days_birth = days_birthController.text.toString();
                        days_employed = days_employedController.text.toString();
                        work_phone = _work_phoneResult.toString();
                        phone = _phoneResult.toString();
                        email = _emailResult.toString();
                        family_size = family_sizeController.text.toString();
                        begin_month = begin_monthController.text.toString();
                        insertJSONData();
                        print(_genderResult);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff347af0),
                        shape: RoundedRectangleBorder(
                          // 모서리 모양
                          borderRadius:
                              BorderRadius.circular(20.0), // 모서리 모양 둥글게
                        ),
                      ),
                      child: Container(
                        width: 160,
                        height: 40,
                        alignment: Alignment.center,
                        child: const Text(
                          '고객 추가하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  insertJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/team_new4_card_insert.jsp?numberId=$numberId&gender=$gender&car=$car&reality=$reality&child_num=$child_num&income_total=$income_total&income_type=$income_type&edu_type=$edu_type&family_type=$family_type&house_type=$house_type&days_birth=$days_birth&days_employed=$days_employed&work_phone=$work_phone&phone=$phone&email=$email&family_size=$family_size&begin_month=$begin_month');
    var response = await http.get(url); // await니까 대기 했다가 build에서 화면 그리면 실행함
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      results = dataConvertedJSON['results'];
    });
    if (results == 'OK') {
      _insertShowDialog(context); //showDialong는 context를 무조건 가져간다.
    } else {
      errorSnackBar(context); //snackbar도 context를 무조건 가져간다.
    }
  }

  _insertShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text('입력 결과'),
              content: Text('입력이 완료 되었습니다.'),
              actions: [
                CupertinoDialogAction(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TabbarPage();
                    }));
                  },
                ),
              ],
            ));
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 정보 입력에 문제가 발생 하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // >>> END <<<