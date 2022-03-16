import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictPage extends StatefulWidget {
  const PredictPage({Key? key}) : super(key: key);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  final TextEditingController inputIDController = TextEditingController();
  late List data;
  late int csid;
  void initState() {
    super.initState();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffedf2fb),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ), // appbar 뒤로가기 버튼 색깔 변경
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
        body: SingleChildScrollView(
          child: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Container(
                height: 500,
                width: 350,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '고객 ID',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: inputIDController,
                      decoration: InputDecoration(
                        labelText: '고객 ID를 입력해 주세요.',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 20, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          csid = int.parse(inputIDController.text);
                          getJSONData();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                          shape: RoundedRectangleBorder(
                            // 모서리 모양
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                            // 모서리 모양 둥글게
                          ),
                        ),
                        child: Container(
                          width: 160,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text(
                            '확인',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
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
                                    Text(data[index]['gendercode'].toString()),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      '차 : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(data[index]['carcode'].toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: data.length,
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/team_new4_card.jsp?csid=$csid');
    var response = await http.get(url); // await니까 대기 했다가 build에서 화면 그리면 실행함
    setState(() {
      var dataConvertedJSON = json.decode(
          utf8.decode(response.bodyBytes)); // reponse에 내용 있는 부분 ---> body
      List result = dataConvertedJSON['results'];
      data.addAll(result); // add는 하나씩, addAll은 전체 다
    });
    return response.body;
  }
}
