import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/surveys/survey_details.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../helper/appcolors.dart';
import '../models/survey_model.dart';
import '../provider/survey_provider.dart';
import '../provider/theme_provider.dart';
import '../utils/config.dart';
import '../utils/database_helper.dart';
import '../widgets/dialog_helper.dart';

class RejectedSurveys extends StatefulWidget {
  const RejectedSurveys({super.key});

  @override
  State<RejectedSurveys> createState() => _RejectedSurveysState();
}

class _RejectedSurveysState extends State<RejectedSurveys> {
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              builder: (context, surveyProvider, child) {
                final rejectedSurveys = displayedSurveys.where((survey) => survey.status == "Rejected").toList();
                if (query.isNotEmpty && rejectedSurveys.isEmpty) {
                  return Center(
                    child: Text(
                      "No rejected inspection(s)",
                      style: TextStyle(
                        color: textColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  );
                } else if (rejectedSurveys.isEmpty) {
                  return Center(
                    child: Text(
                      "No rejected inspection(s)",
                      style: TextStyle(
                        color: textColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: rejectedSurveys.length,
                    itemBuilder: (context, index) {
                      final survey = rejectedSurveys[index];
                      return _rejectedInspections(survey);
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

  _rejectedInspections(dynamic data) {
    return GestureDetector(
      onTap: () {
        fetchSingleSurvey(data.referenceNumber);
      },
      child: SlideUp(
        delay: 300,
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
                      color: const Color(0xffd62839).withOpacity(0.7),
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
                                  color: const Color(0xffd62839).withOpacity(0.7),
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

  _viewSurvey(String reference) async {
    String url = Config.viewSurvey;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? auth_token = preferences.getString(Config.token);
    String postedData = "authorization=Bearer $auth_token&reference_number=$reference";

    DialogBuilder(context).showLoadingIndicator('Viewing');

    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );
      debugPrint('View survey response: $response');

      dynamic decodedString = jsonDecode(response.toString());
      dynamic inspectorResult = decodedString['response'];

      dynamic code = inspectorResult['code'];
      String message = inspectorResult['message'];
      if (code == 200) {
        DialogBuilder(context).hideOpenDialog();
        dynamic data = inspectorResult["data"];
        debugPrint("View survey data 💁 : $data");
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          barrierColor: AppColors.primaryColor.withOpacity(0.5),
          builder: (_) => SurveyDetails(data: data),
        );
      } else {
        DialogBuilder(context).hideOpenDialog();
        Config.customFlushbar("Notice", message, context);
      }
    } on DioException catch (Exception) {
      DialogBuilder(context).hideOpenDialog();
      Config.customFlushbar("Network error", "Please check your internet", context);
    } catch (Exception) {
      DialogBuilder(context).hideOpenDialog();
      Config.customFlushbar("Notice", Exception.toString(), context);
    }
  }

  void fetchSingleSurvey(String referenceNumber) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    Map<String, dynamic>? survey = await dbHelper.getSingleSurvey(referenceNumber);
    if (survey != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        barrierColor: AppColors.primaryColor.withOpacity(0.5),
        builder: (_) => SurveyDetails(
          data: survey,
        ),
      );
    } else {
      print('No survey found with reference number $referenceNumber');
      Config.customFlushbar("Missing survey", "Please login again", context);
    }
  }
}
