import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/screens/logout.dart';
import 'package:wps_survey/screens/report.dart';
import 'package:wps_survey/screens/reset_password.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.report),
            title: const Text('Report'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Report()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_person_sharp),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => const ResetPassword(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => const Logout(),
                );
            },
          ),
        ],
      ),
    );
  }
}
