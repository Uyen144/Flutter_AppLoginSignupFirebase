import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart ';
import 'dialog_fail.dart';
import 'dialog_success.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  Future signUp() async {
    //if (passwordConfirmed()) {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _email.text.trim(),
      password: _password.text.trim(),
    );
    //}
  }
  // ham bool k can 'void' - nhung phai co du 2 TH 'true' va 'false'
  // bool passwordConfirmed() {
  //   if (_password.text.trim() == _confirmPassword.text.trim()) {
  //     print('Đăng ký tài khoản thành công');
  //     return true;
  //   } else {
  //     print('Sai mật khẩu');
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 300,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _email, //////////
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tên đăng nhập',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                obscureText: true, //hind password
                controller: _password, /////////
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Mật khẩu',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                obscureText: true, //hind password
                controller: _confirmPassword, /////////
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Xác nhận mật khẩu',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Color(0xff502c97),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: Container(
                  child: Text(
                    'ĐĂNG KÝ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_password.text.trim() == _confirmPassword.text.trim()) {
                    DialogSuccess();
                    signUp();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => DialogFail(),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 3),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 50,
              width: 250,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Đã có tài khoản',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: 3),
                    TextButton(
                      onPressed: widget.showLoginPage,
                      child: Container(
                        child: Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            color: Color(0xff502c97),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
