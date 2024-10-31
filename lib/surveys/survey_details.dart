import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/survey_checkllist/stepper_home.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';

class SurveyDetails extends StatefulWidget {
  const SurveyDetails({super.key});

  @override
  State<SurveyDetails> createState() => _SurveyDetailsState();
}

class _SurveyDetailsState extends State<SurveyDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier * 100,
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
                        ))
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
                  "WPS12345",
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
                  "Golden Tulip Luxury Hotel",
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
                  "Mazizini, Jumbi Kilimani",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Divider(color: AppColors.secondaryColor.withOpacity(0.06)),
                Text(
                  "Type of business",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: Color(0xFF588157),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Sales and accommodation",
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
                      "Status",
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: Color(0xFF38a3a5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "New",
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4)
              ],
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StepperHome(),
                    ),
                  );
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 6,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Start survey",
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
