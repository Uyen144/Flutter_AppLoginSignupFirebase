import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signup_signin/register_page.dart';
import 'auth_page.dart';
import 'home_page.dart';
import 'nav_screen.dart';

class DialogSuccess extends StatelessWidget {
  // final VoidCallback showLoginPage;
  // const DialogSuccess({
  //   super.key,
  //   required this.showLoginPage,
  // });
  // final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Thông báo',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      content: Text(
        'Đăng ký tài khoản thành công',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'OK',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            //signUp();
            print('OK OK');
          },
        ),
      ],
    );
  }
}
