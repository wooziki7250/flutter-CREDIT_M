import 'package:flutter/material.dart';
import 'package:new_team4_app/login/loginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffedf2fb),
        elevation: 0, // appbar 밑에 그림자 제거
        title: const Text( 
          '관리자 로그인',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: const Color(0xffedf2fb),
            child: Column(
              children: <Widget>[
                Image.asset('images/login.png'),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
