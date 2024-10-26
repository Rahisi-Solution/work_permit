import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/surveys/completed.dart';
import 'package:wps_survey/surveys/new.dart';
import 'package:wps_survey/surveys/rejected.dart';

import '../helper/size_config.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

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
        title: Text(
          "Surveys",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
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
    return Container(
      width: SizeConfig.widthMultiplier * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryColor.withOpacity(0.15),
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   stops: [0.2, 0.5, 0.9, 1.4],
        //   colors: [
        //     AppColors.primaryColor.withOpacity(0.1),
        //     AppColors.primaryColor.withOpacity(0.4),
        //     AppColors.primaryColor.withOpacity(0.1),
        //     AppColors.primaryColor.withOpacity(0.4),
        //   ],
        //   tileMode: TileMode.repeated,
        // ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black54,
        tabs: [
          _tabItem(10, "New"),
          _tabItem(5, "Completed"),
          _tabItem(8, "Rejected"),
        ],
      ),
    );
  }

  _pageRenders() {
    return const TabBarView(
      children: [
        NewSurveys(),
        CompletedSurveys(),
        RejectedSurveys(),
      ],
    );
  }

  _tabItem(int count, String title) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 1.6,
            ),
          ),
          count > 0
              ? Expanded(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(start: 5),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        count > 9 ? "9+" : count.toString(),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.textMultiplier * 1.6,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}
