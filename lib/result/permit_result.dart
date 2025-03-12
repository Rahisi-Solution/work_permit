import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/screens/home.dart';

import '../helper/size_config.dart';
import '../provider/theme_provider.dart';
import '../widgets/slide_up.dart';

class PermitResult extends StatefulWidget {
  final dynamic splashData;
  final dynamic permitData;
  const PermitResult({super.key, this.splashData, this.permitData});

  @override
  State<PermitResult> createState() => _PermitResultState();
}

class _PermitResultState extends State<PermitResult> {
  Color? statusColor;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Permit details',
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.textMultiplier * 2.7,
            ),
          ),
        ),
        body: SizedBox(
          width: SizeConfig.widthMultiplier * 100,
          height: SizeConfig.heightMultiplier * 100,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _permitDetails(),
                    SizedBox(height: SizeConfig.heightMultiplier * 1),
                    _statusIndicator(),
                    SizedBox(height: SizeConfig.heightMultiplier * 1),
                    _otherDetails(),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Home(
                          splashData: widget.splashData,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: SizeConfig.widthMultiplier * 30,
                    height: SizeConfig.heightMultiplier * 8,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.home,
                            size: SizeConfig.widthMultiplier * 5,
                            color: Colors.white,
                          ),
                          SizedBox(width: SizeConfig.widthMultiplier * 3),
                          Text(
                            "Back home",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.textMultiplier * 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _permitDetails() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? textColor;
    Color? textColor2;
    if (themeProvider.isDarkMode) {
      textColor = Colors.grey[500];
      textColor2 = Colors.grey[100];
    } else {
      textColor = AppColors.primaryColor;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            child: Image.asset(
              // child: Image.network(
              "assets/images/profile.jpeg",
              // widget.permitData["photo_url"],
              width: SizeConfig.imageSizeMultiplier * 38,
              height: SizeConfig.heightMultiplier * 24,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Surname:',
                  style: TextStyle(
                    color: textColor,
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Text(
                  widget.permitData["surname"],
                  style: TextStyle(
                    color: textColor2,
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Text(
                  'Given Name:',
                  style: TextStyle(
                    color: textColor,
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Text(
                  widget.permitData["given_name"],
                  style: TextStyle(
                    color: textColor2,
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Text(
                  'Nationality:',
                  style: TextStyle(
                    color: textColor,
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Text(
                  widget.permitData["nationality"],
                  style: TextStyle(
                    color: textColor2,
                    fontSize: SizeConfig.textMultiplier * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _statusIndicator() {
    if (widget.permitData["status"] == "Active") {
      statusColor = const Color(0xFF008000);
    } else if (widget.permitData["status"] == "Expired") {
      statusColor = const Color(0xFFd90429);
    } else if (widget.permitData["status"] == "Blocked") {
      statusColor = const Color(0xFFd90429);
    } else {
      statusColor = const Color(0xFFb76935);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 3,
        decoration: BoxDecoration(
            color: statusColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            )),
        child: Center(
          child: Text(
            widget.permitData["status"],
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.textMultiplier * 1.8,
            ),
          ),
        ),
      ),
    );
  }

  _otherDetails() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? textColor;
    Color? textColor2;
    if (themeProvider.isDarkMode) {
      textColor = Colors.white;
      textColor2 = Colors.grey[500];
    } else {
      textColor = AppColors.primaryColor;
      textColor2 = AppColors.primaryColor;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideUp(
            delay: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Passport number:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["passport_number"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Sex:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["sex"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Company:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["company"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Position:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["position"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Permit type:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["permit_type"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Issued date:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["issued_date"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Expiry date:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["expiry_date"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Status:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["status"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          SlideUp(
            delay: 450,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                  child: Text(
                    "Permit number:",
                    style: TextStyle(
                      color: textColor2,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.permitData["permit_number"],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: textColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
