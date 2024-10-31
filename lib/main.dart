import 'package:flutter/material.dart';
import 'package:wps_survey/splash/splash.dart';

import 'helper/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraint, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Work permit Inspection App',
          theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Poppins',
              datePickerTheme: DatePickerThemeData(
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Set border radius here
                ),
              )),
          home: SplashScreen(),
        );
      });
    });
  }
}
