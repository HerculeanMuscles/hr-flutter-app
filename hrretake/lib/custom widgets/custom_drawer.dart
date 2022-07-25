import 'package:flutter/material.dart';
import 'package:hrretake/Pages/history_attend.dart';
import 'package:hrretake/Pages/logout.dart';
import 'package:hrretake/Pages/mark_attend.dart';

import '../Pages/apply_leave.dart';
import '../Pages/kyc_doc.dart';
import '../Pages/leave_quota_status.dart';
import '../Pages/reimbursement.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Human Resources',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Mark Attend'),
            onTap: () {
              Navigator.pop(context);
              // change app state...
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const MarkAttendPage()));// close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Attend History'),
            onTap: () {
              Navigator.pop(context);
              // change app state...
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const HistoryAttend())); // close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Apply Leave'),
            onTap: () {
              Navigator.pop(context);
              // change app state...
              /*Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const ApplyLeave()));*/ // close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('Reimbursement'),
            onTap: () {
              Navigator.pop(context);
              // change app state...
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const Reimbursement())); // close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.assistant_sharp),
            title: const Text('Leave Quota and Status'),
            onTap: () {
              Navigator.pop(context);
              // change app state...
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const LeaveQuotaStatus())); // close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_present),
            title: const Text('KYC Documents'),
            onTap: () {
              Navigator.pop(context);
              // change app state...
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const KycDoc())); // close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.backspace),
            title: const Text('Log Out'),
            onTap: () {
              // change app state...
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const LogOut()));
            },
          ),
        ],
      ),
    );
  }
}
