import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX
import 'package:new_team4_app/login/sign_upPage.dart';
import 'package:new_team4_app/tabbar/tabbarPage.dart';

class LoginForm extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 157),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'ID',
                ),
                autocorrect: false,
                autofocus: false,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                autofocus: false,
                obscureText: true,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  // if(emailController.text.isEmpty){
                  //   emailerrorsnackbar(context);
                  // }else if (passwordController.text.isEmpty){
                  //   passworderrorsnackbar(context);
                  // }else{
                  //   AuthController.instance.login(
                  //     emailController.text.trim(),
                  //     passwordController.text.trim());
                  // }
                  Get.offAll(TabbarPage());
                  // Get.offAll 사용 ---> 로그인 버튼 눌러서 TabbarPage로 이동하면 다시 로그인페이지로 이동 못 함
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
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('등록된 계정이 없으신가요?'),
                  TextButton(
                    onPressed: () {
                      Get.to(SignUpPage());
                    },
                    child: const Text('회원가입'),
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  emailerrorsnackbar(BuildContext context) {
    Get.snackbar(
      'email 입력',
      'email이 입력되지 않았습니다',
      colorText: Colors.white,
      backgroundColor: Colors.black54,
      duration: const Duration(
        seconds: 2,
      ),
    );
  }

  passworderrorsnackbar(BuildContext context) {
    Get.snackbar(
      'Password 입력',
      'Password가 입력되지 않았습니다',
      colorText: Colors.white,
      backgroundColor: Colors.black54,
      duration: const Duration(
        seconds: 2,
      ),
    );
  }
}
