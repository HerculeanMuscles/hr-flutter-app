import 'package:flutter/material.dart';
import 'package:hrretake/custom%20widgets/card_lqa.dart';
import 'package:hrretake/models/leave.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeaveQuotaStatus extends StatefulWidget {
  const LeaveQuotaStatus({Key? key}) : super(key: key);

  @override
  State<LeaveQuotaStatus> createState() => _LeaveQuotaStatusState();
}

class _LeaveQuotaStatusState extends State<LeaveQuotaStatus> {
  @override
  Widget build(BuildContext context) =>
    // text to show the quota and the status
  Scaffold(
    resizeToAvoidBottomInset : false,
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Leave Quota and Status'),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Card(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 12),
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Quota = 3')
              )),
                  Flexible(
                    child: StreamBuilder<List<Leave>>(
                        stream: readLeave(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something is wrong! ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final leaves = snapshot.data;
                            return ListView(
                              children: leaves!.map(buildLeave).toList(),
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
  Widget buildLeave(Leave leave) => CardLqa(
      email: leave.email,
      status: leave.status,
    subject: leave.subject,
    description: leave.description,
    nda: leave.nda
  );

  Stream<List<Leave>> readLeave() => FirebaseFirestore.instance
      .collection("Leave")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Leave.fromJson(doc.data())).toList());
}
