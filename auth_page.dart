import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signup_signin/nav_screen.dart';
import 'package:flutter_signup_signin/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage =!showLoginPage; 
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return NavScreen(showRegisterPage: toggleScreens);
    }
    else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
