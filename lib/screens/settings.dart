import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/authentication/change_password.dart';
import 'package:wps_survey/authentication/logout.dart';
import 'package:wps_survey/screens/report.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../provider/theme_provider.dart';

class Settings extends StatefulWidget {
  final dynamic splashData;
  const Settings({super.key, this.splashData});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangePassword(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.light_mode_outlined),
            title: const Text('Dark theme'),
            // trailing: SizedBox(
            //   width: SizeConfig.widthMultiplier * 50,
            //   child: _toggleButton(),
            // ),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (_) {
                themeProvider.toggleTheme();
              },
              activeColor: Colors.white12,
              activeTrackColor: Colors.white,
              splashRadius: 20,
            ),
            onTap: () {
              themeProvider.toggleTheme();
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
