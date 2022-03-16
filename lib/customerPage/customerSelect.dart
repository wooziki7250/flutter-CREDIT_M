import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomerSelect extends StatefulWidget {
  const CustomerSelect({Key? key}) : super(key: key);

  @override
  _CustomerSelectState createState() => _CustomerSelectState();
}

class _CustomerSelectState extends State<CustomerSelect> {
  TextEditingController numberIdController = TextEditingController();

  late List data;
  late int numberId;
  late String results;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            TextField(
              controller: numberIdController,
              decoration: InputDecoration(labelText: '고객 ID 검색'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                numberId = numberIdController.text.toString() as int;
              },
              child: Text('검색'),
            ),
          ],
        ),
      ),
    );
  }

  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/team_new4_card.jsp?numberId=$numberId');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      data.addAll(result);
    });
  }
} // >>> END <<<
