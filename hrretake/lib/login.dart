import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hrretake/utils.dart';

import 'main.dart';

class LogInWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LogInWidget({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset : false,
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text('Log In'),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                  Container(
                    padding: const EdgeInsets.all(10),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  signIn();
                },
              )
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(text: TextSpan(
            style: const TextStyle(color: Colors.black),
            text: 'Dont have an account?  ',
            children: [
              TextSpan(
                text: 'Register',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  color: Colors.indigo,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
              )
                      ],
                    )

                    )]),
                  )
              ));

  Future signIn() async {

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}



