import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/surveys/completed.dart';
import 'package:wps_survey/surveys/new.dart';
import 'package:wps_survey/surveys/rejected.dart';

import '../helper/size_config.dart';
import '../provider/theme_provider.dart';

class SurveyScreen extends StatefulWidget {
  final dynamic splashData;
  const SurveyScreen({super.key, this.splashData});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Inspections",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: Colors.white,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     CupertinoIcons.back,
        //     color: Colors.white,
        //     size: SizeConfig.widthMultiplier * 7,
        //   ),
        // ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.widthMultiplier * 1),
                    child: _mainAppBar(),
                  ),
                  Expanded(child: _pageRenders())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _mainAppBar() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? cardColor;
    Color? textColor;
    if (themeProvider.isDarkMode) {
      cardColor = const Color(0xff2e4057).withOpacity(0.8);
      textColor = Colors.white;
    } else {
      cardColor = AppColors.primaryColor.withOpacity(0.15);
      textColor = Colors.black54;
    }
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: textColor,
        tabs: [
          _tabItem("Pending"),
          _tabItem("Completed"),
          _tabItem("Rejected"),
        ],
      ),
    );
  }

  _pageRenders() {
    return TabBarView(
      children: [
        NewSurveys(
          splashData: widget.splashData,
        ),
        const CompletedSurveys(),
        const RejectedSurveys(),
      ],
    );
  }

  _tabItem(String title) {
    return Tab(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: SizeConfig.textMultiplier * 1.6,
        ),
      ),
    );
  }
}
