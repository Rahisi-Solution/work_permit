import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../charts/survey_inspection_chart.dart';
import '../utils/config.dart';

class Homescreen2 extends StatefulWidget {
  const Homescreen2({super.key});

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  String username = "";

  @override
  void initState() {
    _prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.primaryColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SizedBox(
            width: SizeConfig.widthMultiplier * 100,
            height: SizeConfig.heightMultiplier * 100,
            child: Column(
              children: [
                _topSection(),
                _surveySummary(),
                _inspectionSummary(),
                _permitsSummary(),
                const Expanded(child: SurveyInspectionChart()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _prepareData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString(Config.username)!;
    });
  }

  _topSection() {
    return Container(
      height: SizeConfig.heightMultiplier * 10,
      width: SizeConfig.widthMultiplier * 100,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello,   $username",
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              CupertinoIcons.person_crop_circle,
              color: Colors.grey[500],
              size: SizeConfig.widthMultiplier * 8,
            ),
          ],
        ),
      ),
    );
  }

  _surveySummary() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inspections summary",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideUp(
                delay: 100,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.orange[900],
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Pending",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 200,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            Text(
                              "65",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 300,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.do_not_disturb_on_total_silence,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              "154",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _permitsSummary() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Permits summary",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideUp(
                delay: 100,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            Text(
                              "103",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Valid",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 200,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.info,
                              color: Colors.red,
                            ),
                            Text(
                              "41",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Invalid",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 300,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.do_not_disturb_on_total_silence,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              "144",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _inspectionSummary() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inspections",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.widthMultiplier * 47,
                height: SizeConfig.heightMultiplier * 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF01251D),
                      const Color(0xFF095978).withOpacity(0.8),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.textMultiplier * 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.textMultiplier * 1.7,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: SizeConfig.widthMultiplier * 47,
                height: SizeConfig.heightMultiplier * 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF01251D),
                      const Color(0xFF095978).withOpacity(0.8),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.add_card,
                            color: Colors.white,
                          ),
                          Text(
                            "349",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.textMultiplier * 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.textMultiplier * 1.6,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
