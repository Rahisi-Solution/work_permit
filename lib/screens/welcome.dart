import 'package:flutter/material.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/inspections/all_inspections.dart';
import 'package:wps_survey/screens/homeScreen2.dart';
import 'package:wps_survey/screens/settings.dart';
import 'package:wps_survey/screens/survey.dart';

class WelcomeScreen extends StatefulWidget {
  final dynamic splashData;
  const WelcomeScreen({Key? key, this.splashData}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;
  var splashData;
  List<Widget>? _screens;

  @override
  void initState() {
    splashData = widget.splashData;
    // List of widgets for each screen
    _screens = [
      // Home(splashData: splashData),
      const Homescreen2(),
      SurveyScreen(splashData: splashData),
      const AllInspections(),
      Settings(splashData: splashData),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens![_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor.withOpacity(0.3),
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Inspections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Survey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
