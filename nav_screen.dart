import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


//login screen
class NavScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const NavScreen({super.key, required this.showRegisterPage});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _email.text.trim(),
      password: _password.text.trim(),
    );
  }

  //statefulWidget
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  //request data to firebase

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
                    'ĐĂNG NHẬP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                onPressed: signIn,
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
                      'Chưa có tài khoản?',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: 3),
                    TextButton(
                      onPressed: widget.showRegisterPage,
                      child: Container(
                        child: Text(
                          'ĐĂNG KÝ',
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
