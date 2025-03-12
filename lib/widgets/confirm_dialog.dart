import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/screens/home.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../helper/appcolors.dart';

class ConfirmDialog extends StatefulWidget {
  final dynamic data;
  const ConfirmDialog({super.key, this.data});

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: SizedBox(
          height: SizeConfig.heightMultiplier * 40,
          width: SizeConfig.imageSizeMultiplier * 90,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideUp(
                  delay: 60,
                  child: Icon(
                    CupertinoIcons.check_mark_circled,
                    color: Colors.green,
                    size: SizeConfig.imageSizeMultiplier * 20,
                  ),
                ),
                Text(
                  "Inspection Saved Successfully",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2.5,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Home(
                          splashData: widget.data,
                        ),
                      ),
                    );
                  },
                  child: SlideUp(
                    delay: 50,
                    child: Container(
                      width: SizeConfig.imageSizeMultiplier * 70,
                      height: SizeConfig.heightMultiplier * 8,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Ok",
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
          ),
        ),
      ),
    );
  }
}
