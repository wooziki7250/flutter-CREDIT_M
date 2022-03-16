import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();

  SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 157),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'email를 입력하세요',
            ),
            autocorrect: false,
            autofocus: false,
          ),
          TextFormField(
            controller: passwordCotroller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password를 입력하세요',
            ),
            autocorrect: false,
            autofocus: false,
            obscureText: true,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              // if(emailController.text.isEmpty){
              //   nickerrorsnackbar(context);
              // }else if(passwordCotroller.text.isEmpty){
              //   pwerrorsnackbar(context);
              // }else{
              // AuthController.instance.register(
              //   emailController.text.trim(),
              //   passwordCotroller.text.trim(),
              //   );
              // }
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
                'SIGNUP',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  pwerrorsnackbar(BuildContext context) {
    Get.snackbar(
      'Password 입력',
      'Password를 입력해주세요',
      duration: const Duration(
        seconds: 2,
      ),
    );
  }

  nickerrorsnackbar(BuildContext context) {
    Get.snackbar(
      'email 입력',
      'email를 입력해주세요',
      duration: const Duration(
        seconds: 2,
      ),
    );
  }

  //   _showDialog(BuildContext context){
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context){
  //       return AlertDialog(
  //         title: const Text('회원가입 완료'),
  //         content: Column(
  //           children: <Widget>[
  //             Image.asset('images/success.png'),
  //             const SizedBox(
  //               height: 50,
  //             ),
  //             ElevatedButton(
  //               onPressed: (){
  //                 AuthController.instance.register(
  //                   nickController.text.trim(),
  //                   pwController.text.trim(),
  //                   phoneController.text.trim(),
  //                   idController.text.trim(),
  //                   );
  //               },
  //               child: const Text('로그인'))
  //           ],
  //         ),
  //       );
  //     });
  // }

}
