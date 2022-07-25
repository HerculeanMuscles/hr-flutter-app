import 'package:flutter/material.dart';
import 'package:hrretake/custom%20widgets/card_ha.dart';
import 'package:hrretake/models/attend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main() {
  runApp(const HistoryAttend());
}

class HistoryAttend extends StatefulWidget {
  const HistoryAttend({Key? key}) : super(key: key);

  @override
  State<HistoryAttend> createState() => _HistoryAttendState();
}

class _HistoryAttendState extends State<HistoryAttend> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text('Attendance History'),
    ),
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget> [
          Flexible(
            child: StreamBuilder<List<Attend>>(
                stream: readAttend(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something is wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final attends = snapshot.data;
                    return ListView(
                      children: attends!.map(buildAttend).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    ),
  );
  Widget buildAttend(Attend attend) => CardHa(
      name: attend.email,
      date: attend.date,
      attendance: attend.attendance
  );

  Stream<List<Attend>> readAttend() => FirebaseFirestore.instance
      .collection("Attend")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Attend.fromJson(doc.data())).toList());
}
