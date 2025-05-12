import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/screens/welcome.dart';
import 'package:wps_survey/widgets/slide_up.dart';

class InvalidPermitDialog extends StatefulWidget {
  final dynamic data;
  const InvalidPermitDialog({super.key, this.data});

  @override
  State<InvalidPermitDialog> createState() => _InvalidPermitDialogState();
}

class _InvalidPermitDialogState extends State<InvalidPermitDialog> {
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
            color: const Color(0XFFdb504F),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideUp(
                  delay: 60,
                  child: Icon(
                    CupertinoIcons.xmark_circle,
                    color: Colors.white,
                    size: SizeConfig.imageSizeMultiplier * 15,
                  ),
                ),
                Text(
                  "Invalid permit",
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 3.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 3),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WelcomeScreen(
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2.5,
                            color: AppColors.primaryColor,
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
