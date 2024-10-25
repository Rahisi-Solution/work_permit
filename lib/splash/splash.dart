import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wps_survey/authentication/login.dart';

import '../helper/helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  var appHeight;
  var appWidth;

  @override
  void initState() {
    super.initState();
    _startTimer();
    // _fetchInitialData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _startTimer() {
    Timer(const Duration(seconds: 3), _handleTimeout);
  }

  _handleTimeout() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    appWidth = MediaQuery.of(context).size.width;
    appHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          height: appHeight,
          width: appWidth,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.5, 0.9],
              colors: [
                Color(0xFF01251D),
                Color(0xFF095978),
                Color(0xFF01251D),
              ],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Image.asset(
                    'assets/images/smz_logo.png',
                    height: appHeight / 3,
                    width: appWidth / 2,
                  ),
                  SizedBox(height: appHeight * 0.010),
                  Text(
                    'Ofisi ya Raisi Kazi Uchumi Na Uwekezaji Zanzibar'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: appHeight * 0.025,
                      color: const Color(0xFFE3E3E3),
                      letterSpacing: 0.7,
                    ),
                  ),
                  SizedBox(height: appHeight * 0.070),
                  Center(
                    child: SizedBox(
                      width: appWidth / 1.5,
                      child: const LinearProgressIndicator(
                        backgroundColor: Color(0xFF01251D),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFE1E1E1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: appHeight * 0.03,
                left: appWidth * 0.4,
                child: Center(
                  child: Text(
                    'v 1.0.1',
                    style: TextStyle(
                      fontSize: appHeight * 0.020,
                      color: Colors.white,
                      fontFamily: 'Inconsolata',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _fetchInitialData() async {
    ConnectivityHelper.isDeviceConnected().then((isConnected) async {
      if (isConnected) {
      } else {
        return Flushbar(
          message: 'Offline device',
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color(0xFFdb3a34),
          icon: const Icon(
            CupertinoIcons.exclamationmark_triangle_fill,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 5),
        )..show(context);
      }
    });
  }
}
