import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hrretake/utils.dart';
import 'main.dart';

class RegisterPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const RegisterPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset : false,
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Register'),
              ),
              body: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && EmailValidator.validate(email)
                                    ? 'Enter a vaild email'
                                    : null,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                            value != null && value.length < 6
                                ? 'Enter min. 6 characters'
                                : null,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Container( padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text('Register'),
                              onPressed: () {
                                signUp();
                              },
                            )
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            text: 'Already have an account?  ',
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 20,
                                  color: Colors.indigo,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignIn,
                              )
                            ]
                        )),
                      ],
                    )
                ),
              )
          ));

  Future signUp() async {

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

