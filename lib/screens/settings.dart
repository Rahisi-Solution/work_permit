import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/authentication/change_password.dart';
import 'package:wps_survey/authentication/logout.dart';
import 'package:wps_survey/help/change_pin_guide.dart';
import 'package:wps_survey/help/inspection_guide.dart';
import 'package:wps_survey/help/permit_verification.dart';
import 'package:wps_survey/screens/report.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../provider/theme_provider.dart';
import '../utils/database_helper.dart';

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
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: Colors.white,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     CupertinoIcons.back,
        //     color: Colors.white,
        //     size: SizeConfig.widthMultiplier * 7,
        //   ),
        // ),
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
              _fetchTotalSurveys();
            },
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey[200],
          ),
          ListTile(
            leading: const Icon(Icons.lock_person_sharp),
            title: const Text('Change PIN'),
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
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey[200],
          ),
          // ListTile(
          //   leading: const Icon(Icons.light_mode_outlined),
          //   title: const Text('Dark theme'),
          //   // trailing: SizedBox(
          //   //   width: SizeConfig.widthMultiplier * 50,
          //   //   child: _toggleButton(),
          //   // ),
          //   trailing: Switch(
          //     value: themeProvider.isDarkMode,
          //     onChanged: (_) {
          //       themeProvider.toggleTheme();
          //     },
          //     activeColor: Colors.white12,
          //     activeTrackColor: Colors.white,
          //     splashRadius: 20,
          //   ),
          //   onTap: () {
          //     themeProvider.toggleTheme();
          //   },
          // ),
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
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey[200],
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => _helpDialog(),
                backgroundColor: Colors.transparent,
              );
            },
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey[200],
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.cursor_rays),
            title: Text('Version 1.0.1'),
          ),
        ],
      ),
    );
  }

  _helpDialog() {
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      height: SizeConfig.heightMultiplier * 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Help center",
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.grey[200],
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InspectionGuide(),
                  ),
                );
              },
              leading: Container(
                width: SizeConfig.widthMultiplier * 20,
                height: SizeConfig.heightMultiplier * 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  CupertinoIcons.compass,
                  size: SizeConfig.widthMultiplier * 9,
                  color: Colors.grey[600],
                ),
              ),
              title: Text(
                "Inspection Guide",
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Simple steps to complete the inspection process",
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PermitVerification(),
                  ),
                );
              },
              leading: Container(
                width: SizeConfig.widthMultiplier * 20,
                height: SizeConfig.heightMultiplier * 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  CupertinoIcons.creditcard,
                  size: SizeConfig.widthMultiplier * 9,
                  color: Colors.grey[600],
                ),
              ),
              title: Text(
                "Permit Verification",
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Check step-by-step guide to verify permit",
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangePinGuide(),
                    ),
                  );
                },
                leading: Container(
                  width: SizeConfig.widthMultiplier * 20,
                  height: SizeConfig.heightMultiplier * 20,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    CupertinoIcons.lock,
                    size: SizeConfig.widthMultiplier * 9,
                    color: Colors.grey[600],
                  ),
                ),
                title: Text(
                  "Change officer PIN",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Quick guide to securely change your PIN",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchTotalSurveys() async {
    final dbHelper = DatabaseHelper();
    int total_surveys = await dbHelper.totalSurveys();
    int pending_inspections = await dbHelper.totalPendingInspections();
    int completed_inspections = await dbHelper.totalCompleteInspections();
    int rejected_inspections = await dbHelper.totalRejectedInspections();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Report(
          totalInspections: total_surveys,
          totalPendingInspections: pending_inspections,
          totalRejectedInspections: rejected_inspections,
          totalCompleteInspections: completed_inspections,
        ),
      ),
    );
  }
}
