import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/helper/slide_up.dart';
import 'package:wps_survey/screens/home.dart';

import '../helper/size_config.dart';
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
  // static Database? _db;

  _showText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.primaryColor,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            fontSize: SizeConfig.textMultiplier * 4,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        "Please login to continue",
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.5,
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      SizedBox(
                        width: SizeConfig.imageSizeMultiplier * 90,
                        height: SizeConfig.heightMultiplier * 10,
                        child: TextField(
                          controller: inspectorNumber,
                          cursorColor: AppColors.secondaryColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                            hintText: 'Officer Number',
                            hintStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2.3, color: AppColors.secondaryColor),
                          ),
                          style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.3, color: AppColors.secondaryColor),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                      ),
                      SizedBox(
                        width: SizeConfig.imageSizeMultiplier * 90,
                        height: SizeConfig.heightMultiplier * 10,
                        child: TextField(
                          controller: inspectorPin,
                          obscureText: _obscureText,
                          cursorColor: AppColors.secondaryColor,
                          keyboardType: const TextInputType.numberWithOptions(),
                          style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.3, color: AppColors.secondaryColor),
                          decoration: InputDecoration(
                            hintText: 'Officer PIN',
                            hintStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2.3, color: AppColors.secondaryColor),
                            border: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.secondaryColor)),
                            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.secondaryColor)),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _showText();
                              },
                              child: _obscureText
                                  ? const Icon(
                                      CupertinoIcons.eye_slash,
                                      color: AppColors.primaryColor,
                                    )
                                  : const Icon(
                                      CupertinoIcons.eye,
                                      color: AppColors.primaryColor,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          validation();
                        },
                        child: SlideUp(
                          delay: 50,
                          child: Container(
                            width: SizeConfig.imageSizeMultiplier * 90,
                            height: SizeConfig.heightMultiplier * 8,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : Text(
                                      "Login",
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
                    bottom: SizeConfig.heightMultiplier * 2,
                    child: Column(
                      children: [
                        SlideUp(
                          delay: 60,
                          child: Text(
                            "Powered by",
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.5,
                              color: AppColors.primaryColor,
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
      // loginRequest(inspectorNumber.text, inspectorPin.text);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
    }
  }

  // void loginRequest(String number, String pin) async {
  //   String url = Config.officerLogin;
  //   Dio dio = Dio();
  //   Options options = Options();
  //   options.contentType = 'application/x-www-form-urlencoded';
  //
  //   String postedData = "username=$number&password=$pin";
  //
  //   try {
  //     Response response = await dio.post(
  //       url,
  //       data: postedData,
  //       options: options,
  //     );
  //     debugPrint('Login response: $response');
  //
  //     dynamic decodedString = jsonDecode(response.toString());
  //     dynamic inspectorResult = decodedString['response'];
  //
  //     dynamic code = inspectorResult['code'];
  //     String message = inspectorResult['message'];
  //
  //     if (code == 200) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       if (!mounted) return;
  //       dynamic inspectorResult = decodedString['user_details'];
  //       print("User details = $inspectorResult");
  //
  //       /* save inspector info to preferences */
  //       dynamic token = inspectorResult['token'];
  //       dynamic username = inspectorResult['username'];
  //       dynamic entryPoint = inspectorResult['entrypoint'];
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       preferences.setString(Config.token, token);
  //       preferences.setString(Config.username, username);
  //       preferences.setString(Config.entryPoint, entryPoint);
  //       saveApplication(inspectorResult["applications"]);
  //       if (!mounted) return;
  //       Navigator.push(
  //         context,
  //         CupertinoPageRoute(
  //           builder: (_) => Home(
  //             data: inspectorResult,
  //           ),
  //         ),
  //       );
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       if (!mounted) return;
  //       debugPrint('response error: $code | $message');
  //       Config.customFlushbar("Error", message, context);
  //     }
  //   } on DioError catch (exception) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     debugPrint('Dio error: $exception');
  //     Config.customFlushbar("Error", 'Dio Error', context);
  //   } catch (exception) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     debugPrint('request error: $exception');
  //     Config.customFlushbar("Error", 'Exception', context);
  //   }
  // }
}
