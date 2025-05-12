import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/utils/config.dart';
import 'package:wps_survey/widgets/dialog_helper.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../provider/theme_provider.dart';
import '../widgets/slide_up.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Color? textColor, buttonColor;
  TextEditingController inspectorNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    if (themeProvider.isDarkMode) {
      textColor = Colors.grey[400];
      buttonColor = AppColors.secondaryColor;
    } else {
      textColor = AppColors.secondaryColor;
      buttonColor = AppColors.primaryColor;
    }
    return PopScope(
      canPop: false,
      child: Center(
        child: SizedBox(
          height: SizeConfig.heightMultiplier * 55,
          width: SizeConfig.widthMultiplier * 95,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.heightMultiplier * 3),
                    Center(
                      child: Container(
                        height: SizeConfig.heightMultiplier * 10,
                        width: SizeConfig.widthMultiplier * 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white70,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 3,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.1),
                          child: Image.asset(
                            'assets/images/smz_logo.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1),
                    Center(
                      child: Text(
                        "Forgot your PIN?",
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1),
                    Center(
                      child: SizedBox(
                        width: SizeConfig.widthMultiplier * 70,
                        child: Text(
                          "Enter your officer number to reset your PIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            color: textColor,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 2),
                    SizedBox(
                      width: SizeConfig.imageSizeMultiplier * 85,
                      height: SizeConfig.heightMultiplier * 10,
                      child: TextField(
                        controller: inspectorNumber,
                        cursorColor: AppColors.secondaryColor,
                        keyboardType: const TextInputType.numberWithOptions(),
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.3, color: textColor),
                        decoration: InputDecoration(
                          hintText: 'Officer number',
                          hintStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2, color: textColor),
                          border: OutlineInputBorder(borderSide: BorderSide(color: textColor!)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textColor!)),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 2),
                    GestureDetector(
                      onTap: () {
                        _validation();
                      },
                      child: SlideUp(
                        delay: 50,
                        child: Container(
                          width: SizeConfig.imageSizeMultiplier * 85,
                          height: SizeConfig.heightMultiplier * 6,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Reset PIN",
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.xmark_circle,
                      size: SizeConfig.widthMultiplier * 6,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validation() {
    if (inspectorNumber.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter inspector number", context);
    } else {
      _submitData();
    }
  }

  _submitData() async {
    String url = Config.resetPassword;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';

    String postedData = "username=${inspectorNumber.text.trim()}";
    DialogBuilder(context).showLoadingIndicator("submiting . . .");

    try {
      Response response = await dio.post(
        url,
        options: options,
        data: postedData,
      );

      dynamic decodedResult = jsonDecode(response.toString());
      dynamic decodedResponse = decodedResult["response"];
      dynamic code = decodedResponse["code"];
      dynamic message = decodedResponse["message"];

      if (code == 200) {
        DialogBuilder(context).hideOpenDialog();
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => _successDialog(),
        );
      } else {
        DialogBuilder(context).hideOpenDialog();
        Config.customFlushbar("Notice", message, context);
      }
    } catch (Exception) {
      DialogBuilder(context).hideOpenDialog();
      Config.customFlushbar("Notice", Exception.toString(), context);
    }
  }

  _successDialog() {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green[600],
        child: Container(
          height: SizeConfig.heightMultiplier * 35,
          width: SizeConfig.widthMultiplier * 90,
          decoration: BoxDecoration(
            color: Colors.green[600],
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
                  'Password reset successfully, SMS sent for your new password!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
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
