import 'dart:convert';

import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/screens/welcome.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../utils/config.dart';
import '../widgets/dialog_helper.dart';

class ChangePassword extends StatefulWidget {
  final dynamic splashData;
  const ChangePassword({super.key, this.splashData});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscurePassword2 = true;

  void _toggle() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggle2() {
    setState(() {
      _obscurePassword2 = !_obscurePassword2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = SizeConfig.heightMultiplier * 100;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change PIN',
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
      body: Material(
        color: Colors.transparent,
        child: Container(
          height: appHeight / 1.5,
          width: appWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 0.9],
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Center(
                  child: Container(
                    height: SizeConfig.heightMultiplier * 12,
                    width: SizeConfig.widthMultiplier * 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white70,
                      border: Border.all(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.5),
                      child: Image.asset(
                        'assets/images/smz_logo.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                Text(
                  'CONFIRM CHANGE PIN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                Center(
                  child: SizedBox(
                    width: SizeConfig.widthMultiplier * 70,
                    child: Text(
                      'Please enter your current PIN and set a new PIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.textMultiplier * 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appWidth * 0.05),
                  child: AvoidKeyboard(
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OLD PIN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.textMultiplier * 1.5,
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                          Container(
                            height: appHeight / 17,
                            width: appWidth / 1.1,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor.withOpacity(0.3), width: 1),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: appHeight * 0.005),
                              child: TextField(
                                controller: _oldPasswordController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor.withOpacity(0.7),
                                ),
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Enter old PIN',
                                  hintStyle: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 1.5,
                                    color: AppColors.primaryColor.withOpacity(0.3),
                                  ),
                                ),
                                cursorColor: AppColors.primaryColor.withOpacity(0.7),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          Text(
                            'NEW PIN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.textMultiplier * 1.5,
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                          Container(
                            height: appHeight / 17,
                            width: appWidth / 1.1,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor.withOpacity(0.3), width: 1),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: appHeight * 0.005),
                              child: TextField(
                                controller: _newPasswordController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                obscureText: _obscurePassword,
                                cursorColor: AppColors.primaryColor.withOpacity(0.7),
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor.withOpacity(0.7),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter new PIN',
                                  hintStyle: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 1.5,
                                    color: AppColors.primaryColor.withOpacity(0.3),
                                  ),
                                  border: InputBorder.none,
                                  suffixIcon: InkWell(
                                    onTap: _toggle,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: appHeight * 0.01),
                                      child: Icon(
                                        _obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                                        color: AppColors.primaryColor.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          Text(
                            'CONFIRM NEW PIN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.textMultiplier * 1.5,
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                          Container(
                            height: appHeight / 17,
                            width: appWidth / 1.1,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor.withOpacity(0.3), width: 1),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: appHeight * 0.005),
                              child: TextField(
                                controller: _confirmPasswordController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                obscureText: _obscurePassword2,
                                cursorColor: AppColors.primaryColor.withOpacity(0.7),
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor.withOpacity(0.7),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Re-enter new PIN',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 1.5,
                                    color: AppColors.primaryColor.withOpacity(0.3),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: _toggle2,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: appHeight * 0.01),
                                      child: Icon(
                                        _obscurePassword2 ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                                        color: AppColors.primaryColor.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 3),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                validateData(
                                  _oldPasswordController.text.trim(),
                                  _newPasswordController.text.trim(),
                                  _confirmPasswordController.text.trim(),
                                );
                              },
                              child: Text(
                                'Request change pin'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateData(String oldPassword, String newPassword, String confirmPassword) {
    if (oldPassword == "") {
      Config.customFlushbar("Notice", "Please enter old password", context);
    } else if (newPassword == "") {
      Config.customFlushbar("Notice", "Please enter new password", context);
    } else if (confirmPassword == "") {
      Config.customFlushbar("Notice", "Please re-enter new password", context);
    } else if (newPassword != confirmPassword) {
      Config.customFlushbar("Notice", "New and confirm password mismatch", context);
    } else {
      changePassword(oldPassword, newPassword, confirmPassword);
    }
  }

  void changePassword(String oldPassword, String newPassword, String confirmPassword) async {
    String url = Config.changePassword;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? authToken = preferences.getString(Config.token);
    String postedData = "authorization=Bearer $authToken&password=$oldPassword"
        "&new_password=$newPassword&retype_password=$confirmPassword";

    DialogBuilder(context).showLoadingIndicator("changing");

    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );
      debugPrint('Change password response: $response');
      dynamic decodedString = jsonDecode(response.toString());
      dynamic inspectorResult = decodedString['response'];
      dynamic message = inspectorResult['message'];
      dynamic code = inspectorResult['code'];

      if (code == 200) {
        DialogBuilder(context).hideOpenDialog();
        showDialog(
          context: context,
          useSafeArea: true,
          barrierDismissible: false,
          builder: (_) => _successDialog(),
        );
      } else {
        DialogBuilder(context).hideOpenDialog();
        Config.customFlushbar("Notice", message, context);
      }
    } catch (Exception) {
      Config.customFlushbar("Notice", Exception.toString(), context);
    }
  }

  _successDialog() {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green[800],
        child: Container(
          height: SizeConfig.heightMultiplier * 40,
          width: SizeConfig.widthMultiplier * 95,
          decoration: BoxDecoration(
            color: Colors.green[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.widthMultiplier * 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.check_mark_circled,
                  size: SizeConfig.widthMultiplier * 20,
                  color: Colors.white,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Text(
                  'PIN changed successfully, please login with your new PIN!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.textMultiplier * 2.1,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WelcomeScreen(
                          splashData: widget.splashData,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: SizeConfig.heightMultiplier * 5,
                    width: SizeConfig.widthMultiplier * 85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'OK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green[600],
                          fontSize: SizeConfig.textMultiplier * 2.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
