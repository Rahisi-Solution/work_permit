import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/authentication/forgot_password.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/models/gender_model.dart';
import 'package:wps_survey/screens/welcome.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../helper/size_config.dart';
import '../provider/theme_provider.dart';
import '../utils/config.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController inspectorNumber = TextEditingController();
  TextEditingController inspectorPin = TextEditingController();
  bool isLoading = false;
  bool _obscureText = true;
  List<GenderModel> genderModel = [];
  // static Database? _db;

  Color? textColor, buttonColor;

  _showText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    genderModel.add(GenderModel(id: '', name: ''));
    super.initState();
  }

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        // statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
              width: SizeConfig.imageSizeMultiplier * 100,
              height: SizeConfig.heightMultiplier * 100,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: SizeConfig.imageSizeMultiplier * 100,
                    decoration: const BoxDecoration(color: AppColors.primaryColor),
                    child: Column(
                      children: [
                        SlideUp(
                          delay: 60,
                          child: Image.asset(
                            "assets/images/smz_logo.png",
                            width: SizeConfig.imageSizeMultiplier * 30,
                            height: SizeConfig.heightMultiplier * 15,
                          ),
                        ),
                        SlideUp(
                          delay: 60,
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 3,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          "Please login to continue",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2.3,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: SizeConfig.imageSizeMultiplier * 100,
                      height: SizeConfig.heightMultiplier * 65,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 8),
                          KeyboardAvoider(
                            child: Container(
                              width: SizeConfig.imageSizeMultiplier * 90,
                              height: SizeConfig.heightMultiplier * 7,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: TextField(
                                    controller: inspectorNumber,
                                    cursorColor: AppColors.secondaryColor,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Officer Number',
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: SizeConfig.textMultiplier * 2.3,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: SizeConfig.textMultiplier * 2.3,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          KeyboardAvoider(
                            child: Container(
                              width: SizeConfig.imageSizeMultiplier * 90,
                              height: SizeConfig.heightMultiplier * 7,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: inspectorPin,
                                          obscureText: _obscureText,
                                          cursorColor: AppColors.secondaryColor,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          // onEditingComplete: () {
                                          //   FocusScope.of(context).unfocus();
                                          //   validation();
                                          // },
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Officer PIN',
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: SizeConfig.textMultiplier * 2.3,
                                              color: AppColors.secondaryColor,
                                            ),
                                          ),
                                          style: TextStyle(
                                            fontSize: SizeConfig.textMultiplier * 2.3,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showText();
                                        },
                                        child: _obscureText
                                            ? Icon(
                                                CupertinoIcons.eye_slash,
                                                color: textColor,
                                              )
                                            : Icon(
                                                CupertinoIcons.eye,
                                                color: textColor,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 5),
                          GestureDetector(
                            onTap: () {
                              validation();
                            },
                            child: SlideUp(
                              delay: 50,
                              child: Container(
                                width: SizeConfig.imageSizeMultiplier * 90,
                                height: SizeConfig.heightMultiplier * 7,
                                decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: isLoading
                                      ? const CircularProgressIndicator(color: Colors.white)
                                      : Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: SizeConfig.textMultiplier * 2.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => const ForgotPassword(),
                              );
                            },
                            child: Text(
                              "Forgot PIN?",
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: SizeConfig.heightMultiplier * 2,
                    child: Column(
                      children: [
                        SlideUp(
                          delay: 60,
                          child: Text(
                            "Powered by",
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.5,
                              color: buttonColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SlideUp(
                          delay: 60,
                          child: Image.asset(
                            "assets/images/rahisi_colored.png",
                            width: SizeConfig.imageSizeMultiplier * 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validation() {
    if (inspectorNumber.text.trim() == "") {
      Config.customFlushbar("Sorry", "Please enter inspector number", context);
    } else if (inspectorPin.text.trim() == "") {
      Config.customFlushbar("Sorry", "Please enter inspector PIN", context);
    } else {
      setState(() {
        isLoading = true;
      });
      loginRequest(inspectorNumber.text.trim(), inspectorPin.text.trim());
    }
  }

  void loginRequest(String number, String pin) async {
    String url = Config.officerLogin;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';

    String postedData = "username=$number&password=$pin";

    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );
      debugPrint('Login response: $response');

      dynamic decodedString = jsonDecode(response.toString());
      dynamic inspectorResult = decodedString['response'];

      dynamic code = inspectorResult['code'];
      String message = inspectorResult['message'];

      if (code == 200) {
        if (!mounted) return;
        dynamic result = inspectorResult['data'];
        dynamic userDetails = result['user_details'];

        /* save inspector info to preferences */
        dynamic token = userDetails['token'];
        dynamic username = userDetails['username'];
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString(Config.token, token);
        preferences.setString(Config.username, username);
        if (!mounted) return;
        _fetchInitialData();
      } else {
        setState(() {
          isLoading = false;
        });
        if (!mounted) return;
        debugPrint('response error: $code | $message');
        Config.customFlushbar("Error", message, context);
      }
    } on DioException catch (exception) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Dio error: $exception');
      Config.customFlushbar("Internet error", 'Please check your internet', context);
    } catch (exception) {
      setState(() {
        isLoading = false;
      });
      debugPrint('request error: $exception');
      Config.customFlushbar("Error", 'Exception', context);
    }
  }

  void _fetchInitialData() async {
    String url = Config.appSplash;
    Dio dio = Dio();
    Options options = Options();

    try {
      Response response = await dio.post(
        url,
        data: '',
        options: options,
      );
      print("Splash response: $response");
      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['response']['code'];
      dynamic message = decodedString['response']['message'];

      if (code == 200) {
        setState(() {
          isLoading = false;
        });
        dynamic data = decodedString['response']['data'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WelcomeScreen(
              splashData: data,
            ),
          ),
        );
      } else {
        setState(() {
          isLoading = false;
        });
        Config.customFlushbar('Code $code', message, context);
      }
    } catch (Exception) {
      print("Unknown splash error: ${Exception}");
      setState(() {
        isLoading = false;
      });
      Config.customFlushbar('Error', Exception.toString(), context);
    }
  }
}
