import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signup_signin/register_page.dart';

class DialogFail extends StatelessWidget {
  const DialogFail({super.key});

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
        'Sai mật khẩu',
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
          },
        ),
      ],
    );
  }
}
