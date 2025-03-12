import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/provider/survey_provider.dart';
import 'package:wps_survey/provider/theme_provider.dart';
import 'package:wps_survey/splash/splash.dart';

import 'helper/size_config.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SurveyProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return LayoutBuilder(
      builder: (context, constraint) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraint, orientation);
            final themeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Work permit Inspection App',
              theme: themeProvider.lightTheme,
              darkTheme: themeProvider.darkTheme,
              themeMode: themeProvider.themeMode,
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
