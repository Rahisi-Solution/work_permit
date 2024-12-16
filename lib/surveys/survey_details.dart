import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/survey_checkllist/stepper_home.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../provider/theme_provider.dart';

class SurveyDetails extends StatefulWidget {
  final dynamic splashData;
  final dynamic data;
  const SurveyDetails({super.key, this.splashData, this.data});

  @override
  State<SurveyDetails> createState() => _SurveyDetailsState();
}

class _SurveyDetailsState extends State<SurveyDetails> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? backgroundColor;
    if (themeProvider.isDarkMode) {
      backgroundColor = Colors.blueGrey[100];
    } else {
      backgroundColor = AppColors.primaryColor.withOpacity(0.05);
    }
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      height: SizeConfig.heightMultiplier * 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3, right: SizeConfig.widthMultiplier * 3),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Center(
                  child: Container(
                    width: SizeConfig.widthMultiplier * 20,
                    height: 3,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Details".toUpperCase(),
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.xmark_circle,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
                Text(
                  "Reference number",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.data["reference_number"],
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: AppColors.secondaryColor.withOpacity(0.06)),
                Text(
                  "Institution",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: Color(0xFFbc6c25),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.data["institution"],
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: AppColors.secondaryColor.withOpacity(0.06)),
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: Color(0xFF540b0e),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.data["location"],
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: AppColors.secondaryColor.withOpacity(0.06)),
                Text(
                  "Status",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: Color(0xFF588157),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.data["status"],
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: AppColors.secondaryColor.withOpacity(0.06)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Created date",
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: Color(0xFF38a3a5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.data["initiated_date"],
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.secondaryColor.withOpacity(0.06)),
              ],
            ),
            widget.data["status"] == "Pending Survey"
                ? Positioned(
                    bottom: SizeConfig.heightMultiplier * 3,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StepperHome(
                              splashData: widget.splashData,
                              refNumber: widget.data["reference_number"],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: SizeConfig.heightMultiplier * 6,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Start survey",
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
