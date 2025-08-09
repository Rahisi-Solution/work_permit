import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/size_config.dart';

class Config {
  /* Online */
  // static const String endPoint = 'https://labour.rahisi.co.tz/api/';  // Old url
  static const String endPoint = 'https://apilabours.rahisi.co.tz/api/';

  // Local endpoints
  // static const String endPoint = 'http://172.16.10.137:7000/api/'; // John
  // static const String endPoint = 'http://172.16.10.158:8000/api/'; // Frolian
  // static const String endPoint = 'http://172.16.10.129:2027/'; // Jose

  static const String appSplash = '${endPoint}splash';
  // static const String appSplash = '${endPoint}app/splash';
  static const String officerLogin = '${endPoint}login';
  static const String saveSurvey = '${endPoint}app/save_checklist';
  static const String allSurveys = '${endPoint}app/all_surveys';
  static const String viewSurvey = '${endPoint}app/view_survey';
  static const String verifyPermit = '${endPoint}app/verify_permit';
  static const String changePassword = '${endPoint}change_password';
  static const String resetPassword = '${endPoint}reset_password';
  static const String saveInspection = '${endPoint}app/save_inspection_checklist';
  static const String allInspections = '${endPoint}all_inspection';

  static const String token = "app_token";
  static const String username = "username";
  static const String pendingInspections = "0";
  static const String completedInspections = "0";
  static const String rejectedInspections = "0";
  static const String totalInspections = "0";

  static Future customFlushbar(String title, String notice, BuildContext context) {
    return Flushbar(
      title: title,
      message: notice,
      titleColor: Colors.white,
      messageSize: SizeConfig.textMultiplier * 1.7,
      titleSize: SizeConfig.textMultiplier * 2,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: const Color(0xFFdb504a),
      shouldIconPulse: true,
      icon: const Icon(
        CupertinoIcons.exclamationmark_triangle_fill,
        color: Colors.white,
      ),
      isDismissible: true,
      borderRadius: BorderRadius.circular(7.0),
      endOffset: const Offset(0, 0.002),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 0.45),
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 2,
        vertical: SizeConfig.heightMultiplier * 1.8,
      ),
      duration: const Duration(seconds: 5),
    ).show(context);
  }
}
