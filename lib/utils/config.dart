import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/size_config.dart';

class Config {
  static const String endPoint = 'https://earrival.rahisi.co.tz/api/pos/';

  static const String officerLogin = '${endPoint}officer_login';
  // static const String verifyPolicy = '${endPoint}get_policy_applicant';
  // static const String markInUse = '${endPoint}mark_inuse';
  // static const String markSeized = '${endPoint}markSeized';
  // static const String changePin = '${endPoint}change_pin';
  // static const String resetPin = '${endPoint}officer_reset_pin';

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
