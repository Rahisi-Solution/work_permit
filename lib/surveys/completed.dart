import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../helper/appcolors.dart';

class CompletedSurveys extends StatefulWidget {
  const CompletedSurveys({super.key});

  @override
  State<CompletedSurveys> createState() => _CompletedSurveysState();
}

class _CompletedSurveysState extends State<CompletedSurveys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return _completedSurveys();
          }),
    );
  }

  _completedSurveys(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.widthMultiplier * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(CupertinoIcons.tag, size: SizeConfig.widthMultiplier * 4),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Mwanamke Initiative Co".toUpperCase(),
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1.5),
                  Row(
                    children: [
                      Icon(CupertinoIcons.location_solid, size: SizeConfig.widthMultiplier * 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Kianga Magharibi A",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                  Row(
                    children: [
                      Icon(CupertinoIcons.chart_bar_alt_fill, size: SizeConfig.widthMultiplier * 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                  Row(
                    children: [
                      Icon(CupertinoIcons.calendar, size: SizeConfig.widthMultiplier * 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "20/11/2024",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              child: Container(
                width: SizeConfig.widthMultiplier * 2,
                decoration: const BoxDecoration(
                  color: Color(0xff09bc8a),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
