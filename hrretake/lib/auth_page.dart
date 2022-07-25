import 'package:flutter/material.dart';
import 'package:hrretake/login.dart';
import 'package:hrretake/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LogInWidget(onClickedSignUp: toggle)
      : RegisterPage(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
