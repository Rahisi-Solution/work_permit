import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/surveys/survey_details.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../helper/appcolors.dart';
import '../models/survey_model.dart';
import '../provider/survey_provider.dart';
import '../provider/theme_provider.dart';
import '../utils/config.dart';
import '../utils/database_helper.dart';

class CompletedSurveys extends StatefulWidget {
  const CompletedSurveys({super.key});

  @override
  State<CompletedSurveys> createState() => _CompletedSurveysState();
}

class _CompletedSurveysState extends State<CompletedSurveys> {
  final TextEditingController _searchController = TextEditingController();
  List<Survey> _filteredSurveys = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    surveyProvider.loadSurveysFromDatabase();
    _searchController.addListener(_filterSurveys);
  }

  void _filterSurveys() {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    query = _searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        _filteredSurveys = [];
      } else {
        _filteredSurveys = surveyProvider.surveys.where((survey) {
          return survey.referenceNumber.toLowerCase().contains(query) || survey.institution.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context);
    List<Survey> displayedSurveys = query.isNotEmpty ? _filteredSurveys : surveyProvider.surveys;
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? textColor;
    if (themeProvider.isDarkMode) {
      textColor = Colors.white;
    } else {
      textColor = AppColors.primaryColor.withOpacity(0.5);
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 5,
                  width: SizeConfig.widthMultiplier * 65,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5, right: SizeConfig.widthMultiplier * 3),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration.collapsed(hintText: 'Search inspection..'),
                            ),
                          ),
                          const Icon(CupertinoIcons.search, color: Colors.blueGrey),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.widthMultiplier * 3),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _filterSurveys();
                    },
                    child: Container(
                      height: SizeConfig.heightMultiplier * 5,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Search",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<SurveyProvider>(
              builder: (context, provider, child) {
                final completedSurveys = displayedSurveys.where((survey) => survey.status == "Completed").toList();
                if (query.isNotEmpty && completedSurveys.isEmpty) {
                  return Center(
                    child: Center(
                      child: Text(
                        "No Completed inspection(s)",
                        style: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                      ),
                    ),
                  );
                }
                if (completedSurveys.isEmpty) {
                  return Center(
                    child: Text(
                      "No Completed inspection(s)",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: completedSurveys.length,
                    itemBuilder: (context, index) {
                      final survey = completedSurveys[index];
                      return _completedInspections(survey);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _completedInspections(dynamic data) {
    return SlideUp(
      delay: 300,
      child: GestureDetector(
        onTap: () {
          fetchSingleSurvey(data.referenceNumber);
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: SizeConfig.heightMultiplier * 12,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: SizeConfig.widthMultiplier * 25,
                    height: SizeConfig.heightMultiplier * 12,
                    decoration: BoxDecoration(
                      color: const Color(0xff008000).withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.briefcase,
                        color: Colors.white,
                        size: SizeConfig.widthMultiplier * 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.institution,
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              color: AppColors.primaryColor.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                          Row(
                            children: [
                              Text(
                                "REF : ",
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                data.referenceNumber,
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  color: const Color(0xff008000).withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.calendar, size: SizeConfig.widthMultiplier * 6),
                              const SizedBox(width: 2),
                              Text(
                                formatDate(data.initiatedDate),
                                style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
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

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  }

  void fetchSingleSurvey(String referenceNumber) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    Map<String, dynamic>? survey = await dbHelper.getSingleSurvey(referenceNumber);
    if (survey != null && mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        barrierColor: AppColors.primaryColor.withOpacity(0.5),
        builder: (_) => SurveyDetails(
          data: survey,
        ),
      );
    } else {
      if (mounted) {
        Config.customFlushbar("Missing survey", "Please login again", context);
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
