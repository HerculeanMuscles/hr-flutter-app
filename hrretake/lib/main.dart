import 'package:flutter/material.dart';
import 'package:hrretake/Pages/apply_leave.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hrretake/utils.dart';

import 'auth_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) => MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      home: const MainPage());

}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong.'));
          } else if (snapshot.hasData) {
            return const ApplyLeave();
          } else {
            return const AuthPage();
        }
      },
    ),
  );
}


