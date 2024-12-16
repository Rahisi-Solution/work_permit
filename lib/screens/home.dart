import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/provider/survey_provider.dart';
import 'package:wps_survey/screens/settings.dart';
import 'package:wps_survey/screens/survey.dart';
import 'package:wps_survey/utils/config.dart';

import '../helper/appcolors.dart';
import '../provider/theme_provider.dart';
import '../result/permit_result.dart';
import '../widgets/dialog_helper.dart';
import '../widgets/slide_up.dart';

class Home extends StatefulWidget {
  final dynamic splashData;
  const Home({super.key, this.splashData});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = "";
  String _scanBarcode = 'Unknown';
  Color? cardColor;

  @override
  void initState() {
    _prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    surveyProvider.syncSurveys();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.primaryColor,
      ),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 100,
              child: Stack(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _topSection(),
                      SizedBox(height: SizeConfig.heightMultiplier * 1),
                      _bodySection(),
                    ],
                  ),
                  // Positioned(
                  //   top: SizeConfig.heightMultiplier * 3,
                  //   left: SizeConfig.widthMultiplier * 5,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (_) => Settings(
                  //             splashData: widget.splashData,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     child: const Icon(
                  //       Icons.settings,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _topSection() {
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      height: SizeConfig.heightMultiplier * 25,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(455),
          bottomLeft: Radius.circular(0),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _topImage(),
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            SizedBox(
              width: SizeConfig.widthMultiplier * 70,
              child: Text(
                "Hello, $username",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _topImage() {
    return SlideUp(
      delay: 250,
      child: Center(
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
    );
  }

  _bodySection() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    if (themeProvider.isDarkMode) {
      cardColor = Colors.grey;
    } else {
      cardColor = AppColors.primaryColor;
    }
    return Padding(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1.5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SurveyScreen(
                    splashData: widget.splashData,
                  ),
                ),
              );
            },
            child: Container(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: cardColor!),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/survey_icon.png',
                          height: SizeConfig.heightMultiplier * 10,
                          width: SizeConfig.widthMultiplier * 22,
                          fit: BoxFit.cover,
                          color: cardColor,
                        ),
                      ),
                      Center(
                        child: Text(
                          "surveys".toUpperCase(),
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2.5,
                            color: cardColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: SizeConfig.heightMultiplier * 0.8,
                        width: SizeConfig.widthMultiplier * 95,
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(500),
                            bottomLeft: Radius.circular(500),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          GestureDetector(
            onTap: () {
              scanQR();
            },
            child: Container(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xff99582a),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/card_icon.png',
                          height: SizeConfig.heightMultiplier * 10,
                          width: SizeConfig.widthMultiplier * 22,
                          fit: BoxFit.cover,
                          color: const Color(0xff99582a),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Verify permit".toUpperCase(),
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2.5,
                            color: const Color(0xff99582a),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 0.8,
                      width: SizeConfig.widthMultiplier * 95,
                      decoration: const BoxDecoration(
                        color: Color(0xff99582a),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(500),
                          bottomLeft: Radius.circular(500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(
                    splashData: widget.splashData,
                  ),
                ),
              );
            },
            child: Container(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xff14746f).withOpacity(0.4),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                      Center(
                        child: Icon(
                          CupertinoIcons.gear,
                          size: SizeConfig.heightMultiplier * 6,
                          color: const Color(0xff14746f),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Settings".toUpperCase(),
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.5,
                              color: const Color(0xff14746f),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 0.8,
                      width: SizeConfig.widthMultiplier * 95,
                      decoration: const BoxDecoration(
                        color: Color(0xff14746f),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(500),
                          bottomLeft: Radius.circular(500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _prepareData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString(Config.username)!;
    });
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
    String filteredString = _scanBarcode.replaceAll('\\', '');
    String refNumber = filteredString.replaceAll('"', '');
    DialogBuilder(context).showLoadingIndicator('Loading ...');
    print("Number ya vice now: 🙋‍ $refNumber");
    _verifyPermit(refNumber);
  }

  _verifyPermit(String reference) async {
    String url = Config.verifyPermit;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(Config.token);

    String postedData = "authorization=Bearer $token&permit_number=X9465/2425/ZP";
    // String postedData = "authorization=Bearer $token&permit_number=$reference";

    try {
      Response response = await dio.post(
        url,
        options: options,
        data: postedData,
      );

      debugPrint("Verify permit response🙋‍: $response");

      dynamic decodedResponse = jsonDecode(response.toString());
      dynamic decodedResult = decodedResponse["response"];
      dynamic code = decodedResult["code"];
      dynamic message = decodedResult["message"];

      if (code == 200) {
        dynamic data = decodedResult["data"];
        DialogBuilder(context).hideOpenDialog();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PermitResult(
              splashData: widget.splashData,
              permitData: data,
            ),
          ),
        );
      } else {
        DialogBuilder(context).hideOpenDialog();
        Config.customFlushbar("Notice", message, context);
      }
    } catch (Exception) {
      debugPrint("Exception on certificate verification: ${Exception}");
      Config.customFlushbar("Notice", Exception.toString(), context);
    }
  }
}
