import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/screens/verify_permit.dart';
import 'package:wps_survey/screens/survey.dart';

import '../helper/appcolors.dart';
import '../helper/slide_up.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          body: SafeArea(
            child: SizedBox(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 100,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _topSection(),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  _bodySection(),
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
                "Hello, Solomon Mwalupani!",
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
    return Padding(
      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1.5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SurveyScreen(),
                ),
              );
            },
            child: Container(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor.withOpacity(0.4)),
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
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Start surveys".toUpperCase(),
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2.5,
                            color: AppColors.primaryColor,
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
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyPermit()));
                },
                child: Container(
                  width: SizeConfig.widthMultiplier * 45,
                  height: SizeConfig.heightMultiplier * 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.secondaryColor.withOpacity(0.4)),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/permit_icon.png',
                              height: SizeConfig.heightMultiplier * 10,
                              width: SizeConfig.widthMultiplier * 22,
                              fit: BoxFit.cover,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Verify permit".toUpperCase(),
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2.5,
                                color: AppColors.primaryColor,
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
                            color: AppColors.secondaryColor,
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
              Container(
                width: SizeConfig.widthMultiplier * 45,
                height: SizeConfig.heightMultiplier * 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xff99582a).withOpacity(0.4)),
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
                            color: Color(0xff99582a),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Verify Card".toUpperCase(),
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.5,
                              color: Color(0xff99582a),
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
                        ))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Container(
            width: SizeConfig.widthMultiplier * 100,
            height: SizeConfig.heightMultiplier * 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xff14746f).withOpacity(0.4)),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                    Center(
                      child: Icon(
                        CupertinoIcons.gear_solid,
                        size: SizeConfig.heightMultiplier * 8,
                        color: Color(0xff14746f),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Settings".toUpperCase(),
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2.5,
                            color: Color(0xff14746f),
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
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
