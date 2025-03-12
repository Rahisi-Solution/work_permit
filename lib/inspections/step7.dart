import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../helper/appcolors.dart';

class Step7 extends StatefulWidget {
  const Step7({super.key});
  static TextEditingController remarks = TextEditingController();

  @override
  State<Step7> createState() => _Step7State();
}

class _Step7State extends State<Step7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.widthMultiplier * 100,
          height: SizeConfig.heightMultiplier * 100,
          child: _remark(),
        ),
      ),
    );
  }

  _remark() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Remarks by inspecting officer',
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: Step7.remarks,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter your remarks',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
